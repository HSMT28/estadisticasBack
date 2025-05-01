package org.estadisticas.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "LEAGUES")
public class Leagues {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "LEAGUE_ID")
    private Long id;

    @Column(name = "LEAGUE_NAME", length = 50, nullable = false)
    private String name;

    @Column(name = "LEAGUE_ID_COUNTRY", nullable = false)
    private Long idCountry;

    @Column(name = "LEAGUE_IMAGE", length = 500)
    private String image;
}
