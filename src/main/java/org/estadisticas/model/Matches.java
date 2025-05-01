package org.estadisticas.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "MATCHES")
public class Matches {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MATCH_ID")
    private Long id;

    @Column(name = "MATCH_ID_LOCAL")
    private Long idLocal;

    @Column(name = "MATCH_ID_VISIT")
    private Long idVisit;

    @Column(name = "GOALS_LOCAL")
    private Long goalsLocal;

    @Column(name = "GOALS_VISIT")
    private Long goalsVisit;

    @Column(name = "CARDS_LOCAL")
    private Long cardsLocal;

    @Column(name = "CARDS_VISIT")
    private Long cardsVisit;

    @Column(name = "CORNERS_LOCAL")
    private Long cornersLocal;

    @Column(name = "CORNERS_VISIT")
    private Long cornersVisit;

    @Column(name = "SHOTS_LOCAL")
    private Long shotsLocal;

    @Column(name = "SHOTS_VISIT")
    private Long shotsVisit;

    @Column(name = "SHOTS_GOAL_LOCAL")
    private Long shotsGoalLocal;

    @Column(name = "SHOTS_GOAL_VISIT")
    private Long shotsGoalVisit;
}
