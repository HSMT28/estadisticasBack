package org.estadisticas.mapper;

import org.estadisticas.dto.IMatchesOutDto;
import org.estadisticas.dto.MatchesOutDto;
import org.mapstruct.Mapper;

import java.util.Collections;
import java.util.List;

@Mapper(componentModel = "spring")
public interface MatchesMapper {

    default MatchesOutDto map(IMatchesOutDto matches) {
        if (matches == null) return null;

        MatchesOutDto dto = new MatchesOutDto();
        dto.setId(matches.getId());
        dto.setIdLocal(matches.getIdLocal());
        dto.setIdVisit(matches.getIdVisit());
        dto.setGoalsLocal(matches.getGoalsLocal());
        dto.setGoalsVisit(matches.getGoalsVisit());
        dto.setCardsYellowLocal(matches.getCardsYellowLocal());
        dto.setCardsRedLocal(matches.getCardsRedLocal());
        dto.setCardsYellowVisit(matches.getCardsYellowVisit());
        dto.setCardsRedVisit(matches.getCardsRedVisit());
        dto.setCornersLocal(matches.getCornersLocal());
        dto.setCornersVisit(matches.getCornersVisit());
        dto.setShotsLocal(matches.getShotsLocal());
        dto.setShotsVisit(matches.getShotsVisit());
        dto.setShotsGoalLocal(matches.getShotsGoalLocal());
        dto.setShotsGoalVisit(matches.getShotsGoalVisit());
        dto.setNameLocal(matches.getNameLocal());
        dto.setNameVisit(matches.getNameVisit());
        dto.setImageLocal(matches.getImageLocal());
        dto.setImageVisit(matches.getImageVisit());
        dto.setResult(matches.getResult());

        return dto;
    }

    default List<MatchesOutDto> mapToDTO(List<IMatchesOutDto> matches) {
        if (matches == null) return Collections.emptyList();
        return matches.stream().map(this::map).toList();
    }
}