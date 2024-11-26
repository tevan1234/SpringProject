package com.example.querysystem.service;

import com.example.querysystem.exception.CertException;
import com.example.querysystem.model.dto.UserCert;

public interface CertService {
	public UserCert getCert(String username, String password) throws CertException;
}
