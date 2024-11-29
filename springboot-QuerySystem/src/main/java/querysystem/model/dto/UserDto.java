package querysystem.model.dto;

import lombok.Data;

@Data
public class UserDto {
	
	private int id;
	private String role;
	private String cardNumber;
	private String name;
	private String phone;
	private String mail;
	private boolean active;
}
