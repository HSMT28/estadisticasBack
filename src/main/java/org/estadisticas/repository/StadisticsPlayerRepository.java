package org.estadisticas.repository;

import org.estadisticas.model.StadisticsPlayer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StadisticsPlayerRepository extends JpaRepository<StadisticsPlayer, Long> {
}
