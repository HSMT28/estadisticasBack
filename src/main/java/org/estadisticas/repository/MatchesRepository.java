package org.estadisticas.repository;

import org.estadisticas.dto.IMatchesOutDto;
import org.estadisticas.model.Matches;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MatchesRepository extends JpaRepository<Matches, Long> {
    @Query(value = """
            SELECT
                mat.MATCH_ID AS id,
                mat.MATCH_ID_LOCAL AS idLocal,
                mat.MATCH_ID_VISIT AS idVisit,
                mat.GOALS_LOCAL AS goalsLocal,
                mat.GOALS_VISIT AS goalsVisit,
                mat.CARDS_RED_LOCAL AS cardsRedLocal,
                mat.CARDS_YELLOW_LOCAL AS cardsYellowLocal,
                mat.CARDS_YELLOW_VISIT AS cardsYellowVisit,
                mat.CARDS_RED_VISIT AS cardsRedVisit,
                mat.CORNERS_LOCAL AS cornersLocal,
                mat.CORNERS_VISIT AS cornersVisit,
                mat.SHOTS_LOCAL AS shotsLocal,
                mat.SHOTS_VISIT AS shotsVisit,
                mat.SHOTS_GOAL_LOCAL AS shotsGoalLocal,
                mat.SHOTS_GOAL_VISIT AS shotsGoalVisit,
                tm1.TEAM_NAME AS nameLocal,
                tm2.TEAM_NAME AS nameVisit,
                tm1.TEAM_IMAGE AS imageLocal,
                tm2.TEAM_IMAGE AS imageVisit,
                CASE
                    WHEN mat.MATCH_ID_LOCAL = :idTeam AND mat.GOALS_LOCAL > mat.GOALS_VISIT THEN 'G'
                    WHEN mat.MATCH_ID_VISIT = :idTeam AND mat.GOALS_VISIT > mat.GOALS_LOCAL THEN 'G'
                    WHEN mat.GOALS_LOCAL = mat.GOALS_VISIT THEN 'E'
                    ELSE 'P'
                END AS result
            FROM MATCHES mat
            JOIN TEAMS tm1 ON tm1.TEAM_ID = mat.MATCH_ID_LOCAL
            JOIN TEAMS tm2 ON tm2.TEAM_ID = mat.MATCH_ID_VISIT
            WHERE mat.MATCH_ID_LOCAL = :idTeam OR mat.MATCH_ID_VISIT = :idTeam
            """, nativeQuery = true)
    List<IMatchesOutDto> findByTeam(Long idTeam);
}
