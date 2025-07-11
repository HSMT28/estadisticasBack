package org.estadisticas.implementations.iservices;

import org.estadisticas.dto.MatchesDto;
import org.estadisticas.dto.MatchesOutDto;

import java.util.List;

public interface IMatchesService {
    List<MatchesOutDto> getMatchesByTeam(Long idTeam);
    String saveMatches(List<MatchesDto> matches);
}
