package querysystem.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import jakarta.transaction.Transactional;
import querysystem.model.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	
	// 查詢所有使用者 (JpaRepository 自帶)
	List<User> findAll();
	
	// 根據 username 查詢使用者
	User findUserByname(String username);
    
    // 根據 userId 查詢使用者
	User findUserById(Integer userId);
    
    // 新增使用者，JpaRepository的save方法會處理 ，在service層呼叫即可
    // void addUser(User user); // 使用 save() 替代 
    
    // 更新使用者的 active 狀態
    @Modifying
    @Transactional
    @Query("update User u set u.active = :active where u.Id = :userId")
    void updateUserActive(Integer userId,Boolean active);
    
    // 更新使用者的 role 狀態
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.role = :role WHERE u.Id = :userId")
    void updateUserRole(Integer userId, String role);

    // 更新使用者的 phone 和 email
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.phone = :phone, u.mail = :mail WHERE u.Id = :userId")
    void updateUserInfo(Integer userId, String phone, String mail);
    
    // 更新使用者的 password hash
    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.password = :newPasswordHash WHERE u.Id = :userId")
    void updatePasswordHash(Integer userId, String newPasswordHash);
    
    // 根據 userId 刪除使用者
    void deleteUserById(Integer userId);
}
