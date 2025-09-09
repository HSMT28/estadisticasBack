package org.estadisticas.dto;

import lombok.Data;

@Data
public class TeamDto {
    private Long idCountry;
    private Long idLeague;
    private String nameTeam;
    private String urlImage;
}
