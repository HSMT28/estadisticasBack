package org.estadisticas.implementations.iservices;

import org.estadisticas.model.Leagues;

import java.util.List;

public interface ILeagueService {
    List<Leagues> getLeagueByCountry(Long idCountry);
}
