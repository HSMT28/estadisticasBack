package org.estadisticas.implementations.services;

import org.estadisticas.implementations.iservices.ILeagueService;
import org.estadisticas.model.Leagues;
import org.estadisticas.repository.LeaguesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeagueService implements ILeagueService {
    @Autowired
    private LeaguesRepository leaguesRepository;

    @Override
    public List<Leagues> getLeagueByCountry(Long idCountry) {
        return leaguesRepository.findByCountry(idCountry);
    }
}
