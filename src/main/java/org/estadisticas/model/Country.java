package org.estadisticas.model;

import jakarta.persistence.*;

import lombok.Data;

@Entity
@Data
@Table(name = "COUNTRY")
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "COUNTRY_ID")
    private Long id;

    @Column(name = "COUNTRY_NAME", nullable = false)
    private String name;

    @Column(name = "COUNTRY_CODE", length = 5, nullable = false)
    private String code;

    @Column(name = "COUNTRY_IMAGE", length = 500)
    private String image;
}
