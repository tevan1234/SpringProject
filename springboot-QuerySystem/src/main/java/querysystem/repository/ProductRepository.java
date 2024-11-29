package querysystem.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import jakarta.transaction.Transactional;
import querysystem.model.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	// 查詢所有產品
    List<Product> findAll();

    // 根據 ID 查詢產品
  //  @Query("SELECT p.Id, p.type, p.rice, p.status, p.sales FROM Product p WHERE p.Id = :productId ")
  //  Product findProductById(Integer prodouctId);

    // 根據產品名稱查詢
    //@Query("SELECT p.Id, p.type, p.rice, p.status, p.sales FROM Product p WHERE p.type = :productType")
    Optional<Product> findProductByType(String productType);
    
    // 新增商品，JpaRepository的save方法會處理
    // void addProduct(Product product); // 使用 save() 替代
    
    @Modifying
    @Transactional
    @Query("UPDATE Product p SET p.price = :price WHERE p.Id = :productId")
    void updateProductPrice(Integer productId,Integer price);
    
    @Modifying
    @Transactional
    @Query("UPDATE Product p SET p.status = :status WHERE p.id = :productId")
    void updateProductStatus(Integer productId,Boolean status);
    
    void deleteById(Integer productId);
    
    @Query("SELECT p.type,(p.sales + COALESCE(COUNT(o.type), 0)) AS Sales FROM Product p LEFT JOIN Order o ON p.type = o.type GROUP BY p.type, p.sales")
    Map<String, Integer>Ranking();
}
