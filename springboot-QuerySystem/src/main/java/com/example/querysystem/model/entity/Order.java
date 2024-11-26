package com.example.querysystem.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "Id")
	    private Integer id;

	    @Column(name = "Holder", length = 45, nullable = false)
	    private String holder;

	    @Column(name = "HolderCN", length = 45, nullable = false)
	    private String holderCN;

	    @Column(name = "Insured", length = 45, nullable = false)
	    private String insured;

	    @Column(name = "InsuredCN", length = 45, nullable = false)
	    private String insuredCN;

	    @Column(name = "Type", length = 45, nullable = false)
	    private String type;

	    @Column(name = "PayType", nullable = false)
	    private Integer payType;

	    @Column(name = "Status", nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
	    private Boolean status;

	    @Column(name = "OrderDate", length = 45, nullable = false)
	    private String orderDate;

	    @Column(name = "Charge", length = 45, nullable = false)
	    private String charge;

	    @Column(name = "Contact", length = 45, nullable = false)
	    private String contact;

	    @Column(name = "Comment", length = 100)
	    private String comment;
}
