package org.estadisticas.controller;

import org.estadisticas.dto.MatchesOutDto;
import org.estadisticas.implementations.iservices.IMatchesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/matches")
public class MatchesController {
    @Autowired private IMatchesService matchesService;

    @GetMapping("/{idTeam}")
    public List<MatchesOutDto> getMatchesByTeam(@PathVariable Long idTeam) {
        return matchesService.getMatchesByTeam(idTeam);
    }
}
