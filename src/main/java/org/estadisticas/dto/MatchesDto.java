package org.estadisticas.dto;

import lombok.Data;

import java.util.List;

@Data
public class MatchesDto {
    private String cardsLocal;
    private String cardsRedLocal;
    private String cardsRedVisitor;
    private String cardsVisitor;
    private String cornersLocal;
    private String cornersVisitor;
    private Long countryLocal;
    private Long countryVisitor;
    private String goalsLocal;
    private String goalsVisitor;
    private Long idLocalTeam;
    private Long idVisitorTeam;
    private String localTeam;
    private String shotsGoalLocal;
    private String shotsGoalVisitor;
    private String shotsLocal;
    private String shotsVisitor;
    private List<PlayerDto> statsPlayer;
    private String visitorTeam;
}
