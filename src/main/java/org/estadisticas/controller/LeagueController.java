package org.estadisticas.controller;

import org.estadisticas.implementations.iservices.ILeagueService;
import org.estadisticas.model.Leagues;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/league")
public class LeagueController {
    @Autowired
    private ILeagueService leagueService;

    @GetMapping("/{idCountry}")
    public List<Leagues> getAllTeams(@PathVariable Long idCountry) {
        return leagueService.getLeagueByCountry(idCountry);
    }
}
