package querysystem.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import querysystem.model.dto.UserDto;
import querysystem.model.entity.User;

@Component
public class UserMapper {
	@Autowired
	private ModelMapper modelMapper;	
	
	public UserDto toDto(User user) {
		// Entity 轉 DTO		
		return modelMapper.map(user, UserDto.class);
	}
	
	public User toEntity(UserDto userDto) {
		// DTO 轉 Entity 
		return modelMapper.map(userDto, User.class);
	}
}
