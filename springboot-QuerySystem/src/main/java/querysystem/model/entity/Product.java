package querysystem.model.entity;

import java.math.BigDecimal;

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
@Table(name = "products")
public class Product {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    @Column(name = "Type", length = 45, nullable = false)
    private String type;

    @Column(name = "Price", nullable = false)
    private Integer price;

    @Column(name = "Status", nullable = false, columnDefinition = "TINYINT(1) DEFAULT 1")
    private Boolean status;

    @Column(name = "Sales", nullable = false, columnDefinition = "INT DEFAULT 0")
    private Integer sales;

}
