package com.example.querysystem.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.example.querysystem.response.ApiResponse;

@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(NumberFormatException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public ResponseEntity<ApiResponse<Object>> handleNumberFormatException(NumberFormatException e){
		ApiResponse<Object> apiResponse = ApiResponse.error(HttpStatus.BAD_REQUEST.value(), "無效的數據格式,"+e);
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(apiResponse);
	}
	
	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ResponseEntity<ApiResponse<Object>> handleException(Exception e){
		ApiResponse<Object> apiResponse = ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR.value(), "伺服器內部錯誤,"+e);
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(apiResponse);
	}
	
	@ExceptionHandler(RuntimeException.class)
	public ResponseEntity<ApiResponse<Object>>handleRuntimeException(RuntimeException e){
		ApiResponse<Object> apiResponse = ApiResponse.error(HttpStatus.FORBIDDEN.value(), "伺服器內部錯誤, "+e);
		return ResponseEntity.status(HttpStatus.FORBIDDEN).body(apiResponse);
	}
}
