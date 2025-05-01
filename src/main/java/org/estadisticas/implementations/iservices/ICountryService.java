package org.estadisticas.implementations.iservices;

import org.estadisticas.dto.CountryOutDto;
import java.util.List;

public interface ICountryService {
    List<CountryOutDto> getAllCountries();
}