package org.estadisticas.implementations.iservices;

import org.estadisticas.dto.MatchesOutDto;
import org.estadisticas.model.Matches;

import java.util.List;

public interface IMatchesService {
    List<MatchesOutDto> getMatchesByTeam(Long idTeam);
}
