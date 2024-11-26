package com.example.querysystem.exception;

public class UserNotFoundException extends Exception{
	public UserNotFoundException() {
		super("查無使用者");
	}
	public UserNotFoundException(String message) {
		super(message);
	}
}
