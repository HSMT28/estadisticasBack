package org.estadisticas.implementations.services;

import org.estadisticas.implementations.iservices.ITeamsService;
import org.estadisticas.model.Teams;
import org.estadisticas.repository.TeamsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamsService implements ITeamsService {
    @Autowired
    private TeamsRepository teamsRepository;

    @Override
    public List<Teams> getAllTeams() {
        return teamsRepository.findAll();
    }

    @Override
    public List<Teams> getTeamsById(Long idLeague) {
        return teamsRepository.findByLeague(idLeague);
    }

    @Override
    public List<Teams> getTeamsByCountry(Long idCountry) {
        return teamsRepository.findByCountry(idCountry);
    }
}
