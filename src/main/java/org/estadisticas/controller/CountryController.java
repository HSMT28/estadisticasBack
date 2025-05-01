package org.estadisticas.controller;

import org.estadisticas.dto.CountryOutDto;
import org.estadisticas.implementations.iservices.ICountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/countries")
public class CountryController {
    @Autowired
    private ICountryService countryService;

    @GetMapping
    public List<CountryOutDto> getAllCountries() {
        return countryService.getAllCountries();
    }
}
