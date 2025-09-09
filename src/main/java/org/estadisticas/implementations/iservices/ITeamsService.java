package org.estadisticas.implementations.iservices;

import org.estadisticas.dto.TeamDto;
import org.estadisticas.model.Teams;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ITeamsService {
    List<Teams> getAllTeams();
    List<Teams> getTeamsById(Long idLeague);
    List<Teams> getTeamsByCountry(Long idCountry);
    String saveTeam(TeamDto team);
    String saveImageTeam(MultipartFile file);
}
