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

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    @Column(name = "Role", length = 50, nullable = false, columnDefinition = "VARCHAR(50) DEFAULT 'CUSTOMER'")
    private String role;

    @Column(name = "CardNumber", length = 45, nullable = false, unique = true)
    private String cardNumber;

    @Column(name = "Name", length = 50, nullable = false)
    private String name;

    @Column(name = "Salt", length = 255, nullable = false)
    private String salt;

    @Column(name = "Password", length = 255, nullable = false)
    private String password;

    @Column(name = "Phone", length = 50)
    private String phone;

    @Column(name = "Mail", length = 255)
    private String mail;

    @Column(name = "Active", columnDefinition = "TINYINT(1) DEFAULT 0")
    private Boolean active = false;
}
