package querysystem.service.impl;

import static java.util.stream.Collectors.toList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import querysystem.exception.PasswordInvalidException;
import querysystem.exception.UserNotFoundException;
import querysystem.mapper.UserMapper;
import querysystem.model.dto.UserDto;
import querysystem.model.entity.User;
import querysystem.repository.UserRepository;
import querysystem.service.UserService;
import querysystem.util.Hash;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<UserDto> findAll() {
		return userRepository.findAll().stream().map(userMapper::toDto).collect(toList());
	}

	@Override
	public UserDto findUserByname(String username) {
		User user = userRepository.findUserByname(username);
		return userMapper.toDto(user);
	}

	@Override
	public void addUser(String cardNumber, String username, String password, String phone, String mail, String role) {
		String salt = Hash.getSalt();
        String newPassword = Hash.getHash(password, salt);
        Boolean active = false;
		
        User user = new User();
        user.setCardNumber(cardNumber);
        user.setName(username);
        user.setSalt(salt);
        user.setPassword(newPassword);
        user.setPhone(phone);
        user.setMail(mail);
        user.setRole(role);
        user.setActive(active);
        
        userRepository.save(user);
	}

	@Override
	public void updateUser(String userId, String active, String role) {
		if(!active.isEmpty()) {
			userRepository.updateUserActive(Integer.parseInt(userId), Boolean.parseBoolean(active));
		}
		if(!role.isEmpty()) {
			userRepository.updateUserRole(Integer.parseInt(userId), role);
		}
	}

	@Override
	public void updatePassword(Integer userId, String username, String oldPassword, String newPassword)
			throws UserNotFoundException, PasswordInvalidException {
		User user = userRepository.findUserByname(username);
        if (user == null) {
            throw new UserNotFoundException();
        }

        String oldPasswordHash = Hash.getHash(oldPassword, user.getSalt());
        if (!oldPasswordHash.equals(user.getPassword())) {
            throw new PasswordInvalidException("原密碼輸入錯誤");
        }

        String newPasswordHash = Hash.getHash(newPassword, user.getSalt());
        userRepository.updatePasswordHash(userId, newPasswordHash);
		
	}

	@Override
	public void updateInfo(String userId, String phone, String mail) {
		if (!phone.isEmpty() && !mail.isEmpty()) {
			userRepository.updateUserInfo(Integer.parseInt(userId), phone, mail);
		}
		
	}

	@Override
	public void deleteUser(String userId) {
		userRepository.deleteUserById(Integer.parseInt(userId));
		
	}

}
