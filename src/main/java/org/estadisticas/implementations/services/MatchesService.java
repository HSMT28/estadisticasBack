package org.estadisticas.implementations.services;

import lombok.RequiredArgsConstructor;
import org.estadisticas.dto.IMatchesOutDto;
import org.estadisticas.dto.MatchesDto;
import org.estadisticas.dto.MatchesOutDto;
import org.estadisticas.dto.PlayerDto;
import org.estadisticas.implementations.iservices.IMatchesService;
import org.estadisticas.mapper.MatchesMapper;
import org.estadisticas.model.Matches;
import org.estadisticas.model.Players;
import org.estadisticas.model.StadisticsPlayer;
import org.estadisticas.repository.MatchesRepository;
import org.estadisticas.repository.PlayersRepository;
import org.estadisticas.repository.StadisticsPlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class MatchesService implements IMatchesService {
    @Autowired
    private MatchesRepository matchesRepository;

    @Autowired
    private StadisticsPlayerRepository stadisticsPlayerRepository;

    @Autowired
    private PlayersRepository playersRepository;

    @Autowired
    private MatchesMapper matchesMapper;

    @Override
    public List<MatchesOutDto> getMatchesByTeam(Long idTeam) {
        List<IMatchesOutDto> r = matchesRepository.findByTeam(idTeam);

        if (r.isEmpty())
            return Collections.emptyList();

        return matchesMapper.mapToDTO(r);
    }

    @Override
    public String saveMatches(List<MatchesDto> matches){
        try{
            for(MatchesDto input : matches){

                //Registrar el partido
                Matches savedMatch = saveMatch(input);

                if (input.getStatsPlayer() != null){
                    for (PlayerDto inputPlayer : input.getStatsPlayer()){
                        Long idPlayer = inputPlayer.getIdplayer();
                        if(inputPlayer.getIdplayer() == 0){

                            //Registrar el jugador
                            idPlayer = savePlayer(inputPlayer);
                        }

                        //Registrar Estadisticas del Jugador
                        saveStadisticsPlayer(inputPlayer, idPlayer, savedMatch.getId());
                    }
                }
            }
            return "Las estadisticas han sido registradas exitosamente";
        }
        catch (Exception ex){
            return "Error Registrando las estadisticas";
        }
    }

    private Matches saveMatch(MatchesDto input){
        Matches match = new Matches();
        match.setIdLocal(input.getIdLocalTeam());
        match.setIdVisit(input.getIdVisitorTeam());
        match.setGoalsLocal(Long.parseLong(input.getGoalsLocal()));
        match.setGoalsVisit(Long.parseLong(input.getGoalsVisitor()));
        match.setCardsYellowLocal(Long.parseLong(input.getCardsLocal()));
        match.setCardsYellowVisit(Long.parseLong(input.getCardsVisitor()));
        match.setCardsRedLocal(Long.parseLong(input.getCardsRedLocal()));
        match.setCardsRedVisit(Long.parseLong(input.getCardsRedVisitor()));
        match.setCornersLocal(Long.parseLong(input.getCornersLocal()));
        match.setCornersVisit(Long.parseLong(input.getCornersVisitor()));
        match.setShotsLocal(Long.parseLong(input.getShotsLocal()));
        match.setShotsVisit(Long.parseLong(input.getShotsVisitor()));
        match.setShotsGoalLocal(Long.parseLong(input.getShotsGoalLocal()));
        match.setShotsGoalVisit(Long.parseLong(input.getShotsGoalVisitor()));

        return matchesRepository.save(match);
    }

    private Long savePlayer(PlayerDto inputPlayer){
        Players player = new Players();
        player.setName(inputPlayer.getName());

        Players savedPlayer = playersRepository.save(player);

        return savedPlayer.getId();
    }

    private void saveStadisticsPlayer(PlayerDto inputPlayer, Long idPlayer, Long idMatch){
        StadisticsPlayer stadisticsPlayer = new StadisticsPlayer();
        stadisticsPlayer.setIdPlayer(idPlayer);
        stadisticsPlayer.setGoals(Long.parseLong(inputPlayer.getGoals()));
        stadisticsPlayer.setAssists(Long.parseLong(inputPlayer.getAssists()));
        stadisticsPlayer.setCards(Long.parseLong(inputPlayer.getCards()));
        stadisticsPlayer.setShots(Long.parseLong(inputPlayer.getShots()));
        stadisticsPlayer.setShotsGoal(Long.parseLong(inputPlayer.getShotsGoal()));
        stadisticsPlayer.setIdMatch(idMatch);

        stadisticsPlayerRepository.save(stadisticsPlayer);
    }
}
