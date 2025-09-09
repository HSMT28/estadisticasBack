package org.estadisticas.implementations.services;

import org.estadisticas.dto.MatchesDto;
import org.estadisticas.dto.PlayerDto;
import org.estadisticas.dto.TeamDto;
import org.estadisticas.implementations.iservices.ITeamsService;
import org.estadisticas.model.Matches;
import org.estadisticas.model.Teams;
import org.estadisticas.repository.TeamsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.MessageFormat;
import java.util.List;

@Service
public class TeamsService implements ITeamsService {
    @Autowired
    private TeamsRepository teamsRepository;

    @Override
    public List<Teams> getAllTeams() {
        return teamsRepository.findAll();
    }

    @Override
    public List<Teams> getTeamsById(Long idLeague) {
        return teamsRepository.findByLeague(idLeague);
    }

    @Override
    public List<Teams> getTeamsByCountry(Long idCountry) {
        return teamsRepository.findByCountry(idCountry);
    }

    @Override
    public String saveTeam(TeamDto data){
        try{
            Teams team = new Teams();
            team.setName(data.getNameTeam());
            team.setImage("");
            team.setIdLeague(data.getIdLeague());
            team.setImage(data.getUrlImage());

            Teams save = teamsRepository.save(team);

            return MessageFormat.format("El equipo: {0}, se registro correctamente.", save.getName());
        }
        catch (Exception ex){
            return "Error Registrando Equipo.";
        }
    }

    @Override
    public String saveImageTeam(MultipartFile file){
        try {
            if (file.isEmpty()) {
                return "Archivo vacío";
            }

            String fileName = file.getOriginalFilename();

            Path path = Paths.get("D:\\Proyectos_Personal\\Estadisticas\\estadisticas\\public\\images\\" + fileName);
            Files.createDirectories(path.getParent()); // Asegura que la carpeta exista

            Files.write(path, file.getBytes());

            return "El archivo a sido guardado correctamente.";
        }
        catch (IOException e) {
            return "Error al guardar el Archivo: " + e.getMessage();
        }
    }
}
