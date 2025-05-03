package org.estadisticas.implementations.services;

import org.estadisticas.implementations.iservices.IPlayersService;
import org.estadisticas.model.Players;
import org.estadisticas.repository.PlayersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlayersService implements IPlayersService {
    @Autowired
    private PlayersRepository playersRepository;

    @Override
    public List<Players> getAllPlayers() {
        return playersRepository.findAll();
    }
}
