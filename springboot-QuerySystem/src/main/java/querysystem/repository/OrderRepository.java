package querysystem.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import querysystem.model.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer>{
	 	List<Order> findAll();
	    
	 	// 根據持卡人卡號過濾訂單
	 	@Query("SELECT o FROM Order o WHERE o.holderCN = :holderCardNumber")
	 	List<Order> filterOrders(String holderCardNumber);
	    
	 	// 根據訂單ID查詢
	 	Optional<Order> findById(Integer orderId);
	    
	    // 根據持卡人卡號查詢
	 	//Order findByHolderCardNumber(String holderCardNumber);

	    // 新增訂單，JpaRepository的save方法會處理
	 	// void addOrder(Order order); // 使用 save() 替代
	 	// 連接商品資料庫

	 	@Modifying
	 	@Transactional
	 	@Query("UPDATE Product p SET p.sales = p.sales + 1 WHERE p.type = :type")
	 	void updateProductSales(String type);	

	    // 更新訂單狀態和評論
	    @Modifying
	    @Transactional
	    @Query("UPDATE Order o SET o.status = :orderStatus, o.comment = :comment WHERE o.id = :orderId")
	    void updateOrder(Integer orderId, Boolean orderStatus, String comment);

	    // 更新訂單的收費和聯繫方式
	    @Modifying
	    @Transactional
	    @Query("UPDATE Order o SET o.charge = :charge, o.contact = :contact WHERE o.id = :orderId")
	    void updateOrderCharge(Integer orderId, String charge, String contact);

	    // 刪除訂單
	    @Modifying
	    @Transactional
	    @Query("DELETE FROM Order o WHERE o.id = :orderId")
	    void deleteById(Integer orderId);

}
