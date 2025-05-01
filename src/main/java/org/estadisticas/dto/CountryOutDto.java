package org.estadisticas.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class CountryOutDto {
    private Long id;
    private String name;
    private String code;
    private String image;
    private Long orden;
}
