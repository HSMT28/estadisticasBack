package org.estadisticas.implementations.services;

import org.estadisticas.implementations.iservices.ICountryService;
import org.estadisticas.repository.CountryRepository;
import org.estadisticas.model.Country;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryService implements ICountryService {
    @Autowired
    private CountryRepository countryRepository;

    @Override
    public List<Country> getAllCountries() {
        return countryRepository.findAll();
    }

    @Override
    public Country getCountryByName(String name) {
        return countryRepository.findByName(name);
    }

    @Override
    public Country saveCountry(Country country) {
        return countryRepository.save(country);
    }
}
