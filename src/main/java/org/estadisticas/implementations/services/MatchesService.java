package org.estadisticas.implementations.services;

import lombok.RequiredArgsConstructor;
import org.estadisticas.dto.MatchesOutDto;
import org.estadisticas.implementations.iservices.IMatchesService;
import org.estadisticas.mapper.MatchesMapper;
import org.estadisticas.repository.MatchesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MatchesService implements IMatchesService {
    @Autowired
    private MatchesRepository matchesRepository;

    @Autowired
    private MatchesMapper matchesMapper;

    @Override
    public List<MatchesOutDto> getMatchesByTeam(Long idTeam) {
        return matchesMapper.mapToDTO(matchesRepository.findByTeam(idTeam));
    }
}
