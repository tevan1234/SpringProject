package com.example.querysystem.exception;

public class PasswordInvalidException extends Exception{
	public PasswordInvalidException() {
		super("密碼無效");
	}
	public PasswordInvalidException(String message) {
		super(message);
	}
}
