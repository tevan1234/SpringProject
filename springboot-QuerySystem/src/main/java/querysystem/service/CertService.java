package querysystem.service;

import querysystem.exception.CertException;
import querysystem.model.dto.UserCert;

public interface CertService {
	public UserCert getCert(String username, String password) throws CertException;
}
