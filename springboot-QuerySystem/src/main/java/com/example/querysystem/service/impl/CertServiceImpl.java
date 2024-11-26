package com.example.querysystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.querysystem.exception.CertException;
import com.example.querysystem.exception.PasswordInvalidException;
import com.example.querysystem.exception.UserNotFoundException;
import com.example.querysystem.model.dto.UserCert;
import com.example.querysystem.model.entity.User;
import com.example.querysystem.repository.UserRepository;
import com.example.querysystem.service.CertService;
import com.example.querysystem.util.Hash;

@Service
public class CertServiceImpl implements CertService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserCert getCert(String username, String password) throws CertException{
		
		User user = userRepository.findUserByname(username);
		if(user == null) {
			throw new UserNotFoundException();
		}
		String passwordHash = Hash.getHash(password, user.getSalt());
		if(!passwordHash.equals(user.getPassword())) {
			throw new PasswordInvalidException();
		}
		UserCert userCert = new UserCert(user.getId(), user.getCardNumber(), user.getName(), user.getRole(), user.getPhone(),user.getMail());
		return userCert;
	}
}
