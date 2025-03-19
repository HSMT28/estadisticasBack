package org.estadisticas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("org.estadisticas")
public class EstadisticasApplication {
    public static void main(String[] args) {
        SpringApplication.run(EstadisticasApplication.class, args);
    }
}