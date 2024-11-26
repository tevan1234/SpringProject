package com.example.querysystem.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.querysystem.model.entity.Product;

import jakarta.transaction.Transactional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	// 查詢所有產品
    List<Product> findAll();

    // 根據 ID 查詢產品
    Optional<Product> findById(Integer prodouctId);

    // 根據產品名稱查詢
    Optional<Product> findByType(String productType);
    
    // 新增商品，JpaRepository的save方法會處理
    // void addProduct(Product product); // 使用 save() 替代
    
    @Modifying
    @Transactional
    @Query("update products p set p.Price = :price where p.Id = :productId")
    void updateProductPrice(Integer productId,Double price);
    
    @Modifying
    @Transactional
    @Query("update products p set p.Status = :status where p.Id = :productId")
    void updateProductStatus(Integer productId,Boolean status);
    
    void deleteById(Integer productId);
    
    @Query("SELECT p.Type,(p.Sales + COALESCE(COUNT(o.Type), 0)) AS Sales FROM products p LEFT JOIN orders o ON p.Type = o.Type GROUP BY p.Type, p.Sales")
    Map<String, Integer>Ranking();
}
