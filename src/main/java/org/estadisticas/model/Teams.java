package org.estadisticas.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "TEAMS")
public class Teams {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TEAM_ID")
    private Long id;

    @Column(name = "TEAM_NAME", length = 100, nullable = false)
    private String name;

    @Column(name = "TEAM_ID_LEAGUE", nullable = false)
    private Long idLeague;

    @Column(name = "TEAM_IMAGE", length = 500)
    private String image;
}
