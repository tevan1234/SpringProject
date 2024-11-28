package querysystem.model.dto;

public class UserCert {
	private Integer userId;
	private String cardNumber;
	private String username;
	private String role;
	private String phone;
	private String mail;
	
	public UserCert(Integer userId,String cardNumber,String username,String role,String phone,String mail) {
		this.userId=userId;
		this.cardNumber=cardNumber;
		this.username=username;
		this.role=role;
		this.phone=phone;
		this.mail=mail;
	}

	public Integer getUserId() {
		return userId;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public String getUsername() {
		return username;
	}

	public String getRole() {
		return role;
	}

	public String getPhone() {
		return phone;
	}
	
	public String getMail() {
		return mail;
	}

	@Override
	public String toString() {
		return "UserCert [userId=" + userId + ", cardNumber=" + cardNumber + ", username=" + username + ", role=" + role + ", phone=" + phone + ", mail=" + mail + "]";
	}	
}
