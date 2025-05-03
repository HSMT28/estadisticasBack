package org.estadisticas.controller;

import org.estadisticas.implementations.iservices.IPlayersService;
import org.estadisticas.model.Players;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/players")
public class PlayersController {
    @Autowired
    private IPlayersService playersService;

    @GetMapping
    public List<Players> getAllPlayers() {
        return playersService.getAllPlayers();
    }
}
