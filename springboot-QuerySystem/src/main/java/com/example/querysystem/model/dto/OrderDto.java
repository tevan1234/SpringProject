package com.example.querysystem.model.dto;

import lombok.Data;

@Data
public class OrderDto {
	private int Oid;
	private String holder;//要保人 
	private String holderCardNumber;//要保人身份證字號 
	private String insured;//被保人
	private String InsuredCardNumber;//被保人身份證字號
	private String Otype;//險種
	private int OpayType;//繳費年期
	private Boolean Ostatus;//保單繳費狀態(繳完/未繳完)
	private String Odate;//簽約日期
	private String Ocharge;//負責業務
	private String Ocontact;//業務員聯繫方式
	private String Ocomment;//備註
	
	//外加欄位
	private double OrderPrice;
}
