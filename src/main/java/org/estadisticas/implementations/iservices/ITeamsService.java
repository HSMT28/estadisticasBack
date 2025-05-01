package org.estadisticas.implementations.iservices;

import org.estadisticas.model.Teams;
import java.util.List;

public interface ITeamsService {
    List<Teams> getAllTeams();
    List<Teams> getTeamsById(Long idLeague);
    List<Teams> getTeamsByCountry(Long idCountry);
}
