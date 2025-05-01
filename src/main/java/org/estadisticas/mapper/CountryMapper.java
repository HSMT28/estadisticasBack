package org.estadisticas.mapper;

import org.estadisticas.dto.CountryOutDto;
import org.estadisticas.model.Country;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface CountryMapper {
    CountryOutDto map(Country country);
    List<CountryOutDto> mapToDTO(List<Country> country);
}
