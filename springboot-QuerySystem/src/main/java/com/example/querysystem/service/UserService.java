package com.example.querysystem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.querysystem.model.dto.UserDto;


@Service
public interface UserService {
	
	List<UserDto> findAll();
	
	Optional<UserDto> findByUsername(String username);
	
	Optional<UserDto> findById(Integer userId);
	
}
