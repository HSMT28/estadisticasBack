package org.estadisticas.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MatchesOutDto {
    private Long id;
    private Long idLocal;
    private Long idVisit;
    private Long goalsLocal;
    private Long goalsVisit;
    private Long cardsYellowLocal;
    private Long cardsRedLocal;
    private Long cardsYellowVisit;
    private Long cardsRedVisit;
    private Long cornersLocal;
    private Long cornersVisit;
    private Long shotsLocal;
    private Long shotsVisit;
    private Long shotsGoalLocal;
    private Long shotsGoalVisit;
    private String nameLocal;
    private String nameVisit;
    private String imageLocal;
    private String imageVisit;
    private String result;
}
