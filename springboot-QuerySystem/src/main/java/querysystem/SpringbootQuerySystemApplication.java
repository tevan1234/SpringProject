package querysystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "querysystem.repository")
public class SpringbootQuerySystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootQuerySystemApplication.class, args);
	}
	
}
