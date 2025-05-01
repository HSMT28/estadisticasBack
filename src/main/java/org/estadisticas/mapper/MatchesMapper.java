package org.estadisticas.mapper;

import org.estadisticas.dto.IMatchesOutDto;
import org.estadisticas.dto.MatchesOutDto;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface MatchesMapper {
    MatchesOutDto map(IMatchesOutDto matches);
    List<MatchesOutDto> mapToDTO(List<IMatchesOutDto> matches);
}
