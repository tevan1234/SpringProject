package querysystem.model.dto;

import lombok.Data;

@Data
public class ProductDto {
	public int id;
	public String type;//險種
	public Integer price;//年繳
	public Boolean status;// 上架中/停賣
	public int sales;//售出件數
}
