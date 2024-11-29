package querysystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import querysystem.exception.CertException;
import querysystem.exception.PasswordInvalidException;
import querysystem.exception.UserNotFoundException;
import querysystem.model.dto.UserCert;
import querysystem.model.entity.User;
import querysystem.repository.UserRepository;
import querysystem.service.CertService;
import querysystem.util.Hash;

@Service
public class CertServiceImpl implements CertService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserCert getCert(String username, String password) throws CertException{
		
		User user = userRepository.findUserByName(username).get();
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
