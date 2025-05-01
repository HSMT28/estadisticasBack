package org.estadisticas.repository;

import org.estadisticas.model.Teams;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeamsRepository extends JpaRepository<Teams, Long> {
    @Query(
            value = """
            SELECT *
            FROM TEAMS te
            WHERE te.TEAM_ID_LEAGUE = :idLeague
            """,
            nativeQuery = true
    )
    List<Teams> findByLeague(Long idLeague);

    @Query(
            value = """
            SELECT te.*
            FROM TEAMS te
            JOIN LEAGUES le ON te.TEAM_ID_LEAGUE = le.LEAGUE_ID
            WHERE (:idCountry IS NULL OR :idCountry = 0 OR le.LEAGUE_ID_COUNTRY = :idCountry)
            """,
            nativeQuery = true
    )
    List<Teams> findByCountry(Long idCountry);
}
