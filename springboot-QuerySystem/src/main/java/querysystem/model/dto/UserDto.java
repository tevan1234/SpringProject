package querysystem.model.dto;

import lombok.Data;

@Data
public class UserDto {
	
	private int Uid;
	private String Urole;
	private String UcardNumber;
	private String Uname;
	private String Uphone;
	private String Umail;
	private boolean Uactive;
}
