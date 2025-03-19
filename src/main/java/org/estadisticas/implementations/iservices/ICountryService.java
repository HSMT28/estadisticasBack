package org.estadisticas.implementations.iservices;

import org.estadisticas.model.Country;
import java.util.List;

public interface ICountryService {
    List<Country> getAllCountries();
    Country getCountryByName(String name);
    Country saveCountry(Country country);
}