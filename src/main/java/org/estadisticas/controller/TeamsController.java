package org.estadisticas.controller;

import org.estadisticas.implementations.iservices.ITeamsService;
import org.estadisticas.model.Teams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
