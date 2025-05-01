package org.estadisticas.implementations.services;

import org.estadisticas.dto.CountryOutDto;
import org.estadisticas.implementations.iservices.ICountryService;
import org.estadisticas.mapper.CountryMapper;
import org.estadisticas.repository.CountryRepository;
import org.estadisticas.model.Country;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryService implements ICountryService {
    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private CountryMapper countryMapper;

    @Override
    public List<CountryOutDto> getAllCountries() {
        List<Country> country = countryRepository.findAll();
        return countryMapper.mapToDTO(country);
    }
}
