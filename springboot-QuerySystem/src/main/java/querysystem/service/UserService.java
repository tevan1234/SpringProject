package querysystem.service;

import java.util.List;
import java.util.Optional;

import querysystem.exception.PasswordInvalidException;
import querysystem.exception.UserNotFoundException;
import querysystem.model.dto.UserDto;


public interface UserService {
	
	List<UserDto> findAll();
	
	UserDto findUserByname(String username);
	
	void addUser(String cardNumber, String username, String password, String phone, String mail, String role);
	
	void RegisterUser(String CardNumber,String username, String password,String phone,String mail,String code,Integer verifycode);
	
	void RegisterUser(String CardNumber,String username, String password,String phone);

	void updateUser(String userId, String active, String role);

    void updatePassword(Integer userId, String username, String oldPassword, String newPassword) throws UserNotFoundException, PasswordInvalidException;

    void updateInfo(String userId, String phone, String mail);

    void deleteUser(String userId);
}
