package org.estadisticas.repository;

import org.estadisticas.model.Leagues;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LeaguesRepository extends JpaRepository<Leagues, Long> {
    @Query(value = """
           SELECT le.*
           FROM LEAGUES le
           JOIN COUNTRY co ON le.LEAGUE_ID_COUNTRY = co.COUNTRY_ID
           WHERE co.COUNTRY_ID = :idCountry
           """, nativeQuery = true)
    List<Leagues> findByCountry(Long idCountry);
}
