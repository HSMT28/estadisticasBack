package org.estadisticas.controller;

import org.estadisticas.dto.MatchesDto;
import org.estadisticas.dto.TeamDto;
import org.estadisticas.implementations.iservices.ITeamsService;
import org.estadisticas.model.Teams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/teams")
public class TeamsController {
    @Autowired private ITeamsService teamService;

    @GetMapping
    public List<Teams> getAllTeams() {
        return teamService.getAllTeams();
    }

    @GetMapping("/{idLeague}")
    public List<Teams> getAllTeams(@PathVariable Long idLeague) {
        return teamService.getTeamsById(idLeague);
    }

    @GetMapping("/teamsByCountry/{idCountry}")
    public List<Teams> getTeamsByCountry(@PathVariable Long idCountry) {
        return teamService.getTeamsByCountry(idCountry);
    }

    @PostMapping("/saveTeam")
    public String saveTeam(@RequestBody TeamDto team) {
        return teamService.saveTeam(team);
    }
}
