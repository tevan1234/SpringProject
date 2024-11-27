package com.example.querysystem.service;

import java.util.List;
import java.util.Optional;

import com.example.querysystem.exception.PasswordInvalidException;
import com.example.querysystem.exception.UserNotFoundException;
import com.example.querysystem.model.dto.UserDto;


public interface UserService {
	
	List<UserDto> findAll();
	
	UserDto findUserByname(String username);
	
	void addUser(String cardNumber, String username, String password, String phone, String mail, String role);

	void updateUser(String userId, String active, String role);

    void updatePassword(Integer userId, String username, String oldPassword, String newPassword) throws UserNotFoundException, PasswordInvalidException;

    void updateInfo(String userId, String phone, String mail);

    void deleteUser(String userId);
}
