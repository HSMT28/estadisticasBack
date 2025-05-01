package org.estadisticas.dto;

public interface IMatchesOutDto {
    Long getId();
    Long getIdLocal();
    Long getIdVisit();
    Long getGoalsLocal();
    Long getGoalsVisit();
    Long getCardsLocal();
    Long getCardsVisit();
    Long getCornersLocal();
    Long getCornersVisit();
    Long getShotsLocal();
    Long getShotsVisit();
    Long getShotsGoalLocal();
    Long getShotsGoalVisit();
    String getNameLocal();
    String getNameVisit();
    String getImageLocal();
    String getImageVisit();
}