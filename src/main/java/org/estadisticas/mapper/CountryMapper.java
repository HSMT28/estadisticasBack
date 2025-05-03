package org.estadisticas.mapper;

import org.estadisticas.dto.CountryOutDto;
import org.estadisticas.model.Country;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface CountryMapper {
    @Mapping(source = "name", target = "name")
    @Mapping(source = "code", target = "code")
    @Mapping(source = "image", target = "image")
    @Mapping(source = "orden", target = "orden")
    CountryOutDto map(Country country);
    List<CountryOutDto> mapToDTO(List<Country> country);
}
