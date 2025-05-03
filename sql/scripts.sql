CREATE DATABASE ESTADISTICAS;
GO

USE ESTADISTICAS;
GO

CREATE TABLE COUNTRY
(
	COUNTRY_ID INT IDENTITY(1,1) PRIMARY KEY,
	COUNTRY_NAME VARCHAR(50),
	COUNTRY_CODE VARCHAR(5),
	COUNTRY_IMAGE VARCHAR(500),
	COUNTRY_ORDEN INT
)
GO

CREATE TABLE LEAGUES
(
	LEAGUE_ID INT IDENTITY(1,1) PRIMARY KEY,
	LEAGUE_NAME VARCHAR(50),
	LEAGUE_IMAGE VARCHAR(500),
	LEAGUE_ID_COUNTRY INT,
	CONSTRAINT FK_LEAGUE_COUNTRY FOREIGN KEY (LEAGUE_ID_COUNTRY) REFERENCES COUNTRY(COUNTRY_ID) ON DELETE CASCADE
)

CREATE TABLE TEAMS
(
	TEAM_ID INT IDENTITY(1,1) PRIMARY KEY,
	TEAM_NAME VARCHAR(100),
	TEAM_ID_LEAGUE INT,
	TEAM_IMAGE VARCHAR(500),
	CONSTRAINT FK_TEAMS_LEAGUE FOREIGN KEY (TEAM_ID_LEAGUE) REFERENCES LEAGUES(LEAGUE_ID) ON DELETE CASCADE
)
GO

INSERT INTO COUNTRY(COUNTRY_NAME, COUNTRY_CODE, COUNTRY_IMAGE, COUNTRY_ORDEN)
VALUES
('Alemania', 'DE', '/images/alemania.png', 1),
('Argentina', 'AR', '/images/argentina.png', 2),
('Brasil', 'BR', '/images/brasil.png', 3),
('Colombia', 'CO', '/images/colombia.png', 4),
('España', 'ES', '/images/espana.png', 5),
('Francia', 'FR', '/images/francia.png', 6),
('Inglaterra', 'EN', '/images/inglaterra.png', 7),
('Italia', 'IT', '/images/italia.png', 8),
('Selecciones', 'SE', '/images/selecciones.png', 9)
GO

INSERT INTO LEAGUES(LEAGUE_NAME, LEAGUE_IMAGE, LEAGUE_ID_COUNTRY)
VALUES
('Bundesliga', '/images/bundesliga.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Alemania')),
('Bundesliga 2', '/images/bundesliga_2.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Alemania')),
('Liga Profesional', '/images/liga_profesional.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Argentina')),
('Primera Nacional', '/images/primera_nacional.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Argentina')),
('Brasileirao', '/images/brasileirao.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Brasil')),
('Campeonato Brasileño Serie B', '/images/brasil_serie_b.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Brasil')),
('Liga Betplay', '/images/liga_betplay.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Colombia')),
('Torneo Betplay', '/images/torneo_betplay.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Colombia')),
('LaLiga', '/images/la_liga.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'España')),
('LaLiga 2', '/images/la_liga_2.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'España')),
('Ligue 1', '/images/ligue_1.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Francia')),
('Ligue 2', '/images/ligue_2.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Francia')),
('Premier League', '/images/premier_league.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Inglaterra')),
('Championship', '/images/championship.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Inglaterra')),
('Serie A', '/images/serie_a.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Italia')),
('Serie B', '/images/serie_b.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Italia')),
('Selecciones', '/images/seleccion.png', (SELECT co.COUNTRY_ID FROM COUNTRY co WHERE co.COUNTRY_NAME = 'Selecciones'))
GO

-- Primera Division Alemania
INSERT INTO TEAMS(TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Bayern Munich', '/images/bayern_munich.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Bayern Leverkusen', '/images/bayern_leverkusen.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Mainz 05', '/images/mainz.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Borussia Dortmund', '/images/borussia_dortmund.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Borussia Monchengladbach', '/images/borussia_monchengladbach.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Eintracht Frankfurt', '/images/frankfurt.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Augsburgo', '/images/augsburgo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('San Pauli', '/images/pauli.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Stuttgart', '/images/stuttgart.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Heidenheim', '/images/heidenheim.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Holstein Kiel', '/images/holstein_kiel.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Leipzig', '/images/leipzig.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Bochum', '/images/bochum.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Freiburgo', '/images/freiburgo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Union Berlin', '/images/union_berlin.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Hoffenheim', '/images/hoffenheim.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Wolfsburgo', '/images/wolfsburgo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga')),
('Werder Bremen', '/images/werder_bremen.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga'))
GO

-- Segunda Division Alemania
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Koln', '/images/koln.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Darmstadt 98', '/images/darmstadt.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Eintracht Brunswick', '/images/eintracht_brunswick.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Elversberg', '/images/elversberg.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Fortuna Düsseldorf', '/images/fortuna_dusseldorf.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Greuther Fürth', '/images/greuther_furth.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Hamburgo SV', '/images/hamburgo_sv.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Hannover 96', '/images/hannover_96.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Hertha Berlín', '/images/hertha_berlin.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Jahn Regensburgo', '/images/jahn_regensburgo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Kaiserslautern', '/images/kaiserslautern.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Karlsruher', '/images/karlsruher.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Magdeburgo', '/images/magdeburgo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Núremberg', '/images/nuremberg.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Paderborn 07', '/images/paderborn.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Preußen Münster', '/images/preussen_munster.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Schalke 04', '/images/schalke_04.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2')),
('Ulm', '/images/ssv_ulm.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Bundesliga 2'));
GO

--Primera Division Argentina
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Aldosivi', '/images/aldosivi.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Argentinos Juniors', '/images/argentinos_juniors.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Atlético Tucumán', '/images/atletico_tucuman.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Banfield', '/images/banfield.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Barracas Central', '/images/barracas_central.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Boca Juniors', '/images/boca_juniors.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Central Córdoba', '/images/central_cordoba.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Defensa y Justicia', '/images/defensa_justicia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Riestra', '/images/riestra.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Estudiantes de La Plata', '/images/estudiantes_lp.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Gimnasia La Plata', '/images/gimnasia_lp.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Godoy Cruz', '/images/godoy_cruz.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Huracán', '/images/huracan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Independiente', '/images/independiente.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Independiente Rivadavia', '/images/independiente_rivadavia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Instituto', '/images/instituto.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Lanús', '/images/lanus.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Newells Old Boys', '/images/newells_old_boys.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Platense', '/images/platense.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Racing Club', '/images/racing_club.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('River Plate', '/images/river_plate.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Rosario Central', '/images/rosario_central.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('San Lorenzo', '/images/san_lorenzo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('San Martín', '/images/san_martin.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Sarmiento de Junín', '/images/sarmiento_junin.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Talleres', '/images/talleres.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Tigre', '/images/tigre.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Unión', '/images/union.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Vélez Sarsfield', '/images/velez_sarsfield.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional')),
('Belgrano', '/images/belgrano.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga Profesional'))
GO

--Segunda Division Argentina
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Atlanta', '/images/atlanta.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('All Boys', '/images/all_boys.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Arsenal', '/images/arsenal_arg.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Deportivo Maipú', '/images/deportivo_maipu.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Tristán Suárez', '/images/tristan_suarez.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Los Andes', '/images/los_andes.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Quilmes', '/images/quilmes.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Almagro', '/images/almagro.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('San Miguel', '/images/san_miguel.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Colegiales', '/images/colegiales.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Ferro', '/images/ferro.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('San Martín de Tucumán', '/images/san_martin_tucuman.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Patronato', '/images/patronato.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Racing de Córdoba', '/images/racing_cordoba.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Güemes', '/images/guemes.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Gimnasia y Tiro', '/images/gimnasia_tiro.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Deportivo Madryn', '/images/deportivo_madryn.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Alvarado de Mar del Plata', '/images/alvarado.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Gimnasia y Esgrima de Mendoza', '/images/gimnasia_mendoza.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Defensores de Belgrano', '/images/defensores_belgrano.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Nueva Chicago', '/images/nueva_chicago.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('San Telmo', '/images/san_telmo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Almirante Brown', '/images/almirante_brown.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Talleres de Remedios de Escalada', '/images/talleres_re.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Temperley', '/images/temperley.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Estudiantes de Caseros', '/images/estudiantes_caseros.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Estudiantes de Río Cuarto', '/images/estudiantes_rc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Deportivo Morón', '/images/deportivo_moron.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Chacarita', '/images/chacarita.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Defensores Unidos', '/images/defensores_unidos.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Colón', '/images/colon.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Chaco For Ever', '/images/chaco_forever.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Mitre', '/images/mitre.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Central Norte', '/images/central_norte.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Gimnasia (Jujuy)', '/images/gimnasia_jujuy.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional')),
('Agropecuario', '/images/agropecuario.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Primera Nacional'))
GO

--Brasileirao
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Bragantino', '/images/bragantino.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Corinthians', '/images/corinthians.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Mirassol', '/images/mirassol.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Palmeiras', '/images/palmeiras.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Santos', '/images/santos.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('São Paulo', '/images/sao_paulo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Botafogo', '/images/botafogo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Flamengo', '/images/flamengo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Fluminense', '/images/fluminense.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Vasco da Gama', '/images/vasco_da_gama.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Grêmio', '/images/gremio.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Internacional', '/images/internacional.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Juventude', '/images/juventude.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Bahia', '/images/bahia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Vitória', '/images/vitoria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Ceará', '/images/ceara.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Fortaleza', '/images/fortaleza.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Atlético Mineiro', '/images/atletico_mineiro.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Cruzeiro', '/images/cruzeiro.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao')),
('Sport Recife', '/images/sport_recife.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Brasileirao'))
GO

--Campeonato Brasileño Serie B

INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Amazonas', '/images/amazonas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('América Mineiro', '/images/america_mineiro.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Athletic Club', '/images/athletic_club_bra.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Atlético Goianiense', '/images/atletico_goianiense.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Atlético Paranaense', '/images/paranaense.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Avaí', '/images/avai.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Botafogo-SP', '/images/botafogo_sp.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Chapecoense', '/images/chapecoense.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Coritiba', '/images/coritiba.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('CRB', '/images/crb.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Criciúma', '/images/criciuma.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Cuiabá', '/images/cuiaba.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Ferroviária', '/images/ferroviaria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Goiás', '/images/goias.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Novorizontino', '/images/novorizontino.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Operário', '/images/operario.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Paysandu', '/images/paysandu.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Remo', '/images/remo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Vila Nova', '/images/vila_nova.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B')),
('Volta Redonda', '/images/volta_redonda.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Campeonato Brasileño Serie B'))
GO

--Liga Betplay
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Águilas Doradas', '/images/aguilas_doradas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Alianza FC', '/images/alianza.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('América de Cali', '/images/america_de_cali.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Atlético Bucaramanga', '/images/atletico_bucaramanga.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Atlético Nacional', '/images/atletico_nacional.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Boyacá Chicó', '/images/boyaca_chico.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Deportes Tolima', '/images/deportes_tolima.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Deportivo Cali', '/images/deportivo_cali.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Deportivo Pasto', '/images/deportivo_pasto.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Deportivo Pereira', '/images/deportivo_pereira.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Envigado FC', '/images/envigado_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Independiente Medellín', '/images/independiente_medellin.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Independiente Santa Fe', '/images/independiente_santa_fe.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Fortaleza CEIF', '/images/fortaleza_ceif.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Junior de Barranquilla', '/images/junior_de_barranquilla.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('La Equidad', '/images/la_equidad.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Millonarios FC', '/images/millonarios_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Once Caldas', '/images/once_caldas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Unión Magdalena', '/images/union_magdalena.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay')),
('Llaneros FC', '/images/llaneros_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Liga BetPlay'))
GO

--Torneo Betplay
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Patriotas', '/images/patriotas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Internacional FC', '/images/internacional_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Cúcuta', '/images/cucuta.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Jaguares', '/images/jaguares.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Cartagena', '/images/cartagena.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Cundinamarca', '/images/cundinamarca.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Atlético Huila', '/images/atletico_huila.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Real Santander', '/images/real_santander.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Orsomarso', '/images/orsomarso.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Leones', '/images/leones.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Tigres', '/images/tigres.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Quindío', '/images/quindio.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Bogotá FC', '/images/bogota_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Boca Juniors Cali', '/images/boca_juniors_cali.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Barranquilla FC', '/images/barranquilla_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay')),
('Atlético FC', '/images/atletico_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Torneo Betplay'))
GO

--La Liga
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Deportivo Alavés', '/images/deportivo_alaves.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Athletic Club', '/images/athletic_club.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Atlético de Madrid', '/images/atletico_madrid.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('FC Barcelona', '/images/fc_barcelona.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Real Betis', '/images/real_betis.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Celta de Vigo', '/images/celta_vigo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('RCD Espanyol', '/images/rcd_espanyol.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Getafe CF', '/images/getafe_cf.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Girona FC', '/images/girona_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('UD Las Palmas', '/images/ud_las_palmas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('CD Leganés', '/images/cd_leganes.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('RCD Mallorca', '/images/rcd_mallorca.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('CA Osasuna', '/images/ca_osasuna.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Rayo Vallecano', '/images/rayo_vallecano.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Real Madrid CF', '/images/real_madrid.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Real Sociedad', '/images/real_sociedad.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Sevilla FC', '/images/sevilla_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Valencia CF', '/images/valencia_cf.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Real Valladolid', '/images/real_valladolid.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga')),
('Villarreal CF', '/images/villareal_cf.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga'))
GO

--La Liga 2
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Albacete', '/images/albacete.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('UD Almería', '/images/almeria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Burgos CF', '/images/burgos.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Cádiz CF', '/images/cadiz.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('FC Cartagena', '/images/cartagena_esp.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('CD Castellón', '/images/castellon.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Córdoba CF', '/images/cordoba.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('RC Deportivo de La Coruña', '/images/deportivo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('SD Eibar', '/images/eibar.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Elche CF', '/images/elche.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('CD Eldense', '/images/eldense.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Granada CF', '/images/granada.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('SD Huesca', '/images/huesca.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Levante UD', '/images/levante.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Málaga CF', '/images/malaga.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('CD Mirandés', '/images/mirandes.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Real Oviedo', '/images/oviedo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Racing de Ferrol', '/images/racing_ferrol.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Real Racing Club de Santander', '/images/racing_santander.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Real Sporting de Gijón', '/images/sporting_gijon.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('CD Tenerife', '/images/tenerife.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2')),
('Real Zaragoza', '/images/zaragoza.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'LaLiga 2'))
GO

--Ligue 1
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Paris Saint-Germain', '/images/psg.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Olympique de Marsella', '/images/olympique_marsella.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('AS Mónaco', '/images/as_monaco.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('OGC Niza', '/images/ogc_niza.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Olympique de Lyon', '/images/olympique_lyon.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('LOSC Lille', '/images/losc_lille.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('RC Estrasburgo', '/images/rc_estrasburgo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('RC Lens', '/images/rc_lens.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Brest', '/images/brest.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Toulouse FC', '/images/toulouse_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('AJ Auxerre', '/images/auxerre.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Rennes FC', '/images/rennes.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('FC Nantes', '/images/fc_nantes.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Angers SCO', '/images/angers_sco.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Reims', '/images/reims.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('AS Saint-Étienne', '/images/saint_etienne.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Le Havre', '/images/le_havre.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1')),
('Montpellier', '/images/montpellier.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 1'))
GO

--Ligue 2
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('AC Ajaccio', '/images/ac_ajaccio.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Amiens SC', '/images/amiens_sc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Annecy FC', '/images/annecy_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('SM Caen', '/images/sm_caen.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Clermont Foot', '/images/clermont_foot.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Dunkerque', '/images/dunkerque.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Grenoble', '/images/grenoble.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Guingamp', '/images/guingamp.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Bastia', '/images/bastia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('FC Lorient', '/images/fc_lorient.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('FC Metz', '/images/fc_metz.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('FC Martigues', '/images/fc_martigues.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Paris FC', '/images/paris_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Pau FC', '/images/pau_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Red Star FC', '/images/red_star_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Rodez AF', '/images/rodez_af.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Laval', '/images/laval.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2')),
('Troyes', '/images/troyes.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Ligue 2'))
GO

--Premier League
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Arsenal FC', '/images/arsenal.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Aston Villa FC', '/images/aston_villa.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('AFC Bournemouth', '/images/bournemouth.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Brentford FC', '/images/brentford.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Brighton & Hove Albion FC', '/images/brighton.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Chelsea FC', '/images/chelsea.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Crystal Palace FC', '/images/crystal_palace.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Everton FC', '/images/everton.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Fulham FC', '/images/fulham.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Liverpool', '/images/liverpool.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Manchester City FC', '/images/manchester_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Manchester United FC', '/images/manchester_united.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Newcastle United FC', '/images/newcastle_united.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Nottingham Forest', '/images/nottingham_forest.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Ipswich', '/images/ipswich.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Tottenham Hotspur FC', '/images/tottenham_hotspur.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('West Ham United FC', '/images/west_ham.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Wolverhampton Wanderers FC', '/images/wolves.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Leicester City', '/images/leicester_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League')),
('Southampton', '/images/southampton.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Premier League'))
GO

--Championship
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Leeds United', '/images/leeds_united.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Sheffield United', '/images/sheffield_united.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Burnley', '/images/burnley.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Sunderland', '/images/sunderland.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Coventry City', '/images/coventry_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('West Bromwich Albion', '/images/west_brom.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Bristol City', '/images/bristol_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Middlesbrough', '/images/middlesbrough.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Blackburn Rovers', '/images/blackburn_rovers.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Watford FC', '/images/watford_fc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Millwall', '/images/millwall.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Sheffield Wednesday', '/images/sheffield_wednesday.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Norwich City', '/images/norwich_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Preston North End', '/images/preston_north_end.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Queens Park Rangers (QPR)', '/images/qpr.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Swansea City', '/images/swansea_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Portsmouth', '/images/portsmouth.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Oxford United', '/images/oxford_united.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Hull City', '/images/hull_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Stoke City', '/images/stoke_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Cardiff City', '/images/cardiff_city.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Derby County', '/images/derby_county.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Luton Town', '/images/luton_town.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship')),
('Plymouth Argyle', '/images/plymouth_argyle.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Championship'))
GO

--Serie A
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Inter de Milán', '/images/inter_de_milan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Nápoles', '/images/napoles.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Atalanta', '/images/atalanta.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Bolonia', '/images/bolonia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Juventus', '/images/juventus.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Lazio', '/images/lazio.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Roma', '/images/roma.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Fiorentina', '/images/fiorentina.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('AC Milan', '/images/ac_milan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Udinese', '/images/udinese.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Torino', '/images/torino.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Genoa', '/images/genoa.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Como', '/images/como.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Hellas Verona', '/images/hellas_verona.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Cagliari', '/images/cagliari.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Lecce', '/images/lecce.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Parma', '/images/parma.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Empoli', '/images/empoli.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Venezia', '/images/venezia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A')),
('Monza', '/images/monza.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie A'))
GO

--Serie B
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Frosinone Calcio', '/images/frosinone.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Sassuolo Calcio', '/images/sassuolo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('U.S. Salernitana 1919', '/images/salernitana.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Mantova 1911', '/images/mantova.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Cesena FC', '/images/cesena.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('S.S. Juve Stabia', '/images/juve_stabia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Carrarese Calcio', '/images/carrarese.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Modena FC', '/images/modena.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('AC Reggiana 1919', '/images/reggiana.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Brescia Calcio', '/images/brescia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('US Cremonese', '/images/cremonese.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('US Catanzaro 1929', '/images/catanzaro.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Cosenza Calcio', '/images/cosenza.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('UC Sampdoria', '/images/sampdoria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Spezia Calcio', '/images/spezia_calcio.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Pisa SC', '/images/pisa_sc.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('SSC Bari', '/images/bari.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('Palermo FC', '/images/palermo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('FC Südtirol', '/images/sudtirol.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B')),
('AS Cittadella', '/images/cittadella.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Serie B'))
GO

--Selecciones
INSERT INTO TEAMS (TEAM_NAME, TEAM_IMAGE, TEAM_ID_LEAGUE)
VALUES
('Argentina', '/images/argentina.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Francia', '/images/francia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('España', '/images/espana.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Inglaterra', '/images/inglaterra.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Brasil', '/images/brasil.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Portugal', '/images/portugal.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Países Bajos', '/images/paises_bajos.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Belgica', '/images/belgica.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Italia', '/images/italia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Alemania', '/images/alemania.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Uruguay', '/images/uruaguay.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Colombia', '/images/colombia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Croacia', '/images/croacia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Marruecos', '/images/marruecos.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Japón', '/images/japon.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Estados Unidos', '/images/estados_unidos.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Senegal', '/images/senegal.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Irán', '/images/iran.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('México', '/images/mexico.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Suiza', '/images/suiza.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Dinamarca', '/images/dinamarca.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Austria', '/images/austria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Ecuador', '/images/ecuador.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Corea del sur', '/images/corea_sur.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Ucrania', '/images/ucrania.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Australia', '/images/australia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Suecia', '/images/suecia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Turquía', '/images/turquia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Gales', '/images/gales.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Hungría', '/images/hungria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Canadá', '/images/canada.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Serbia', '/images/serbia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Egipto', '/images/egipto.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Rusia', '/images/rusia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Polonia', '/images/polonia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Panamá', '/images/panama.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Argelia', '/images/argelia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Rumanía', '/images/rumania.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Grecia', '/images/grecia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Perú', '/images/peru.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Eslovaquia', '/images/eslovaquia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('República Checa', '/images/republica_checa.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Noruega', '/images/noruega.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Nigeria', '/images/nigeria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Escocia', '/images/escocia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Costa de Marfil', '/images/costa_de_marfil.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Venezuela', '/images/venezuela.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Qatar', '/images/qatar.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Camerún', '/images/camerun.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Chile', '/images/chile.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Mali', '/images/mali.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Túnez', '/images/tunez.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Paraguay', '/images/paraguay.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Costa Rica', '/images/costa_rica.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Eslovenia', '/images/eslovenia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Irak', '/images/irak.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Sudáfrica', '/images/sudafrica.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Uzbekistán', '/images/uzbekistan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Arabia Saudí', '/images/arabia_saudi.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Irlanda', '/images/irlanda.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Congo', '/images/congo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Jamaica', '/images/jamaica.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Emiratos Árabes Unidos (EAU)', '/images/eau.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Jordania', '/images/jordania.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Albania', '/images/albania.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Burkina Faso', '/images/burkina_faso.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Macedonia del Norte', '/images/macedonia_del_norte.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Georgia', '/images/georgia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Finlandia', '/images/finlandia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Islandia', '/images/islandia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Irlanda del Norte', '/images/irlanda_del_norte.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Cabo Verde', '/images/cabo_verde.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Montenegro', '/images/montenegro.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Bosnia y Herzegovina', '/images/bosnia_y_herzegovina.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Honduras', '/images/honduras.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Israel', '/images/israel.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Ghana', '/images/ghana.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Guinea', '/images/guinea.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Bolivia', '/images/bolivia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Omán', '/images/oman.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Baréin', '/images/barein.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Bulgaria', '/images/bulgaria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('El Salvador', '/images/salvador.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Gabón', '/images/gabon.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Angola', '/images/angola.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Haití', '/images/haiti.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Zambia', '/images/zambia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Uganda', '/images/uganda.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Nueva Zelanda', '/images/nueva_zelanda.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('China', '/images/china.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Curazao', '/images/curazao.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Luxemburgo', '/images/luxemburgo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Guinea Ecuatorial', '/images/guinea_ecuatorial.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Benín', '/images/benin.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Siria', '/images/siria.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Mozambique', '/images/mozambique.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Tailandia', '/images/tailandia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Bielorrusia', '/images/bielorrusia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Kosovo', '/images/kosovo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Armenia', '/images/armenia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Palestina', '/images/palestina.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Trinidad y Tobago', '/images/trinidad_tobago.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Comoras', '/images/comoras.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Tayikistán', '/images/tayikistan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Guatemala', '/images/guatemala.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Tanzania', '/images/tanzania.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('República Kirguisa', '/images/republica_kirguisa.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Kenia', '/images/kenia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Mauritania', '/images/mauritania.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Kazajistán', '/images/kazajistan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Namibia', '/images/namibia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Líbano', '/images/libano.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Sudán', '/images/sudan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Vietnam', '/images/vietnam.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Corea del Norte', '/images/corea_norte.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Madagascar', '/images/madagascar.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Azerbaiyán', '/images/azerbaiyan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Libia', '/images/libia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Togo', '/images/togo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Guinea-Bissáu', '/images/guinea_bissau.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Zimbabue', '/images/zimbabue.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Níger', '/images/niger.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Estonia', '/images/estonia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Ruanda', '/images/ruanda.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Gambia', '/images/gambia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('India', '/images/india.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Indonesia', '/images/indonesia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Congo', '/images/congo.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Sierra Leona', '/images/sierra_leona.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Chipre', '/images/chipre.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Malaui', '/images/malaui.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Malasia', '/images/malasia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Nicaragua', '/images/nicaragua.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Kuwait', '/images/kuwait.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('República Centroafricana', '/images/republica_centroafricana.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Botsuana', '/images/botsuana.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Islas Feroe', '/images/islas_feroe.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Surinam', '/images/surinam.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Burundi', '/images/burundi.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Letonia', '/images/letonia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('República Dominicana', '/images/republica_dominicana.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Lituania', '/images/lituania.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Turkmenistán', '/images/turkmenistan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('San Cristóbal y Nieves', '/images/san_cristobal_nieves.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Liberia', '/images/liberia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Etiopía', '/images/etiopia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Islas Salomón', '/images/islas_salomon.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Fiyi', '/images/fiyi.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Lesoto', '/images/lesoto.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Filipinas', '/images/filipinas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Moldavia', '/images/moldavia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Nueva Caledonia', '/images/nueva_caledonia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Tahití', '/images/tahiti.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Guyana', '/images/guyana.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Hong Kong, China', '/images/hong_kong.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Afganistán', '/images/afganistan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Puerto Rico', '/images/puerto_rico.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Yemen', '/images/yemen.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Esuatini', '/images/esuatini.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Singapur', '/images/singapur.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Antigua y Barbuda', '/images/antigua_barbuda.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Maldivas', '/images/maldivas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Cuba', '/images/cuba.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Vanuatu', '/images/vanuatu.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Chinese Taipei', '/images/chinese_taipei.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Bermudas', '/images/bermudas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Santa Lucía', '/images/santa_lucia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Malta', '/images/malta.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Myanmar', '/images/myanmar.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Sudán del Sur', '/images/sudan_sur.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Andorra', '/images/andorra.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Papúa Nueva Guinea', '/images/papua_nueva_guinea.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('San Vicente y las Granadinas', '/images/san_vicente_granadinas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Granada', '/images/granada.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Nepal', '/images/nepal.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Chad', '/images/chad.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Barbados', '/images/barbados.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Belice', '/images/belice.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Mauricio', '/images/mauricio.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Camboya', '/images/camboya.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Montserrat', '/images/montserrat.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Bután', '/images/butan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Dominica', '/images/dominica.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Brunéi Darussalam', '/images/brunei_darussalam.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Bangladesh', '/images/bangladesh.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Laos', '/images/laos.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Samoa Estadounidense', '/images/samoa_estadounidense.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Mongolia', '/images/mongolia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Santo Tomé y Príncipe', '/images/santo_tome_principe.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Islas Cook', '/images/islas_cook.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Yibuti', '/images/yibuti.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Samoa', '/images/samoa.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Macao', '/images/macao.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Islas Caimán', '/images/islas_caiman.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Aruba', '/images/aruba.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Gibraltar', '/images/gibraltar.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Timor Oriental', '/images/timor_oriental.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Pakistán', '/images/pakistan.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Tonga', '/images/tonga.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Sri Lanka', '/images/sri_lanka.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Seychelles', '/images/seychelles.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Somalia', '/images/somalia.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Guam', '/images/guam.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Liechtenstein', '/images/liechtenstein.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Bahamas', '/images/bahamas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Turcas y Caicos', '/images/turcas_caicos.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Islas Vírgenes Británicas', '/images/islas_virgenes_britanicas.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Islas Vírgenes Estadounidenses', '/images/islas_virgenes_estadounidenses.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('Anguila', '/images/anguila.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones')),
('San Marino', '/images/san_marino.png', (SELECT le.LEAGUE_ID FROM LEAGUES le WHERE le.LEAGUE_NAME = 'Selecciones'))
GO

CREATE TABLE PLAYERS
(
	PLAYER_ID INT IDENTITY(1,1) PRIMARY KEY,
	PLAYER_NAME VARCHAR(100)
)
GO

CREATE TABLE MATCHES
(
	MATCH_ID INT IDENTITY(1,1) PRIMARY KEY,
	MATCH_ID_LOCAL INT,
	MATCH_ID_VISIT INT,
	GOALS_LOCAL INT NULL,
	GOALS_VISIT INT NULL,
	CARDS_LOCAL INT NULL,
	CARDS_VISIT INT NULL,
	CORNERS_LOCAL INT NULL,
	CORNERS_VISIT INT NULL,
	SHOTS_LOCAL INT NULL,
	SHOTS_VISIT INT NULL,
	SHOTS_GOAL_LOCAL INT NULL,
	SHOTS_GOAL_VISIT INT NULL,
	CONSTRAINT FK_TEAM_MATCH FOREIGN KEY (MATCH_ID_LOCAL) REFERENCES TEAMS(TEAM_ID),
	CONSTRAINT FK_TEAM_MATCH_2 FOREIGN KEY (MATCH_ID_VISIT) REFERENCES TEAMS(TEAM_ID)
)
GO

CREATE TABLE STADISTICS_MATCH_PLAYER
(
	STADISTICS_ID INT IDENTITY(1,1) PRIMARY KEY,
	STADISTICS_ID_PLAYER INT,
	STADISTICS_GOALS INT NULL,
	STADISTICS_ASSISTS INT NULL,
	STADISTICS_SHOTS INT NULL,
	STADISTICS_SHOTS_GOAL INT NULL,
	STADISTICS_CARDS INT NULL,
	STADISTICS_ID_MATCH INT,
	CONSTRAINT FK_MATCH_STADISTICS FOREIGN KEY (STADISTICS_ID_MATCH) REFERENCES MATCHES(MATCH_ID),
	CONSTRAINT FK_PLAYER_STADISTICS FOREIGN KEY (STADISTICS_ID_PLAYER) REFERENCES PLAYERS(PLAYER_ID)
)
GO