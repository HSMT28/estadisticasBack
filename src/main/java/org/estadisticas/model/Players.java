package org.estadisticas.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "PLAYERS")
public class Players {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PLAYER_ID")
    private Long id;

    @Column(name = "PLAYER_NAME", length = 100, nullable = false)
    private String name;
}
