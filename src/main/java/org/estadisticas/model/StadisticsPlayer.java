package org.estadisticas.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "STADISTICS_MATCH_PLAYER")
public class StadisticsPlayer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "STADISTICS_ID")
    private Long id;

    @Column(name = "STADISTICS_ID_PLAYER", nullable = false)
    private Long idPlayer;

    @Column(name = "STADISTICS_GOALS")
    private Long goals;

    @Column(name = "STADISTICS_ASSISTS")
    private Long assists;

    @Column(name = "STADISTICS_SHOTS")
    private Long shots;

    @Column(name = "STADISTICS_SHOTS_GOAL")
    private Long shotsGoal;

    @Column(name = "STADISTICS_CARDS")
    private Long cards;

    @Column(name = "STADISTICS_ID_MATCH")
    private Long isMatch;
}
