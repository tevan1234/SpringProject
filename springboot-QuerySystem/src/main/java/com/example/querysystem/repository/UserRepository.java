package com.example.querysystem.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.querysystem.model.entity.User;

import jakarta.transaction.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	
	// 查詢所有使用者 (JpaRepository 自帶)
	List<User> findAll();
	
	// 根據 username 查詢使用者
    Optional<User> findByUsername(String username);
    
    // 根據 userId 查詢使用者
    Optional<User> findById(Integer userId);
    
    // 更新使用者的 active 狀態
    @Modifying
    @Transactional
    @Query("update users u set u.Active = :active where u.Id = :userId")
    void updateUserActive(Integer userId,Boolean active);
    
    // 更新使用者的 role 狀態
    @Modifying
    @Transactional
    @Query("UPDATE users u SET u.Role = :role WHERE u.Id = :userId")
    void updateUserRole(Integer userId, String role);

    // 更新使用者的 phone 和 email
    @Modifying
    @Transactional
    @Query("UPDATE users u SET u.Phone = :phone, u.Mail = :mail WHERE u.Id = :userId")
    void updateUserInfo(Integer userId, String phone, String mail);
    
    // 更新使用者的 password hash
    @Modifying
    @Transactional
    @Query("UPDATE users u SET u.Password = :newPasswordHash WHERE u.Id = :userId")
    void updatePasswordHash(Integer userId, String newPasswordHash);
    
    // 根據 userId 刪除使用者
    void deleteById(Integer userId);
}
