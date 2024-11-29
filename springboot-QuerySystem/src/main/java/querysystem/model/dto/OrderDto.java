package querysystem.model.dto;

import lombok.Data;

@Data
public class OrderDto {
	private int id;
	private String holder;//要保人 
	private String holderCN;//要保人身份證字號 
	private String insured;//被保人
	private String InsuredCN;//被保人身份證字號
	private String type;//險種
	private int payType;//繳費年期
	private Boolean status;//保單繳費狀態(繳完/未繳完)
	private String date;//簽約日期
	private String charge;//負責業務
	private String contact;//業務員聯繫方式
	private String comment;//備註
	
	//外加欄位
	private double OrderPrice;
}
