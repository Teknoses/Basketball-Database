create table player(
  id serial,
  first_name varchar,
  last_name varchar,
  primary key(id)
  );
  
  insert into player (first_name,last_name) values
  ('Kawhi', 'Leonard'), ('Michael', 'Jordan'), ('Lebron', 'James'), ('Shaquille', 'O''Neal'),('Jeremy','Lin'), ('Giannis','Antetokounmpo'),('Stephen','Curry'),('Luka','Doncic'),('Kevin','Durant'),('Kobe','Bryant')
  ;
  
  create table roles(
    id serial,
    role varchar,
    primary key (id)
    );
    
  insert into roles(role) values
  ('Point Guard'), ('Shooting Guard'), ('Power Forward'), ('Small Forward'), ('Centre')
  ;
  
  create table team(
    id serial,
    name varchar,
    primary key (id)
    );
    
   insert into team(name) values
   ('Toronto Raptors'), ('Los Angeles Lakers'), ('Los Angeles Clippers')
   ;
    
  create table player_team_role(
    player_id serial,
    primary key(player_id),
    team_id integer,
    role_id integer,
    constraint fk_player_id foreign key(player_id) references player(id), 
    constraint fk_team_id foreign key(team_id) references team(id), 
    constraint fk_role foreign key(role_id) references roles(id)
  );
  
  insert into player_team_role(player_id,team_id, role_id) values
  (1,1,4),(2,2,4),(3,1,4),(4,2,5),(5,1,5),(6,2,3),(7,1,1),(8,2,1),(9,1,3),(10,2,2)
  ;

create table game_type(
  id serial,
  primary key(id),
  type varchar
 );
 
insert into game_type(type) values
  ('Regualr Season'), ('Playoff')
;

create table game_date(
  	id serial,
  	day integer,
  	month integer,
  	year integer,
  	primary key(id)
  );

insert into game_date(id, day, month, year) values
  	(1,27,2,2009)
    ; 

create table game_teams(
  id serial,
  primary key(id),
  team_one_id integer,
  team_two_id integer,
  home_team integer,
  constraint fk_team_one_id foreign key(team_one_id) references team(id),
  constraint fk_team_two_id foreign key(team_two_id) references team(id),
  constraint fk_home_team foreign key(home_team) references team(id)
  );
 
insert into game_teams(team_one_id , team_two_id, home_team) values
	(1,2,2)
	;
 
create table game_status(
  id serial,
  primary key(id),
  date_id integer,
  constraint fk_date_id foreign key(date_id) references game_date(id),
  game_type_id integer,
  constraint fk_game_type_id foreign key(game_type_id) references game_type(id),
  teams_id integer,
  constraint fk_teams_id foreign key(teams_id) references game_teams(id)
 
  );
  
 insert into game_status(id, date_id, game_type_id, teams_id) values
  	(1,1,1,1)
    ; 

create table game_id_scoreboard(
  id serial,
  primary key(id),
  game_id integer,
  player_id integer,
  team_id integer,
  minutes_played integer,
  field_goals_made integer,
  field_goals_attempted integer,
  three_pointers_made integer,
  three_pointers_attempted integer,
  free_throws_made integer,
  free_throws_attempted integer,
  offensive_rebounds integer,
  defensive_rebounds integer,
  assists integer,
  steals integer,
  blocks integer,
  turnovers integer,
  personal_fouls integer,
  constraint fk_game_id foreign key(game_id) references game_status(id),
  constraint fk_player_id foreign key(player_id) references player_team_role(player_id),
  constraint fk_team_id foreign key(team_id) references player_team_role(player_id)
);
  
insert into game_id_scoreboard(player_id, 
                            game_id,
                            team_id,
                            minutes_played,
                            field_goals_attempted,
                            field_goals_made,
                            three_pointers_made, 
                            three_pointers_attempted, 
                            free_throws_made, 
                            free_throws_attempted, 
                            offensive_rebounds, 
                            defensive_rebounds, 
                            assists, 
                            steals, 
                            blocks, 
                            turnovers, 
                            personal_fouls) values
(1,1,1, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(2,1,2, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(3,1,1, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(4,1,2, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(5,1,1, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(6,1,2, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(7,1,1, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(8,1,2, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(9,1,1, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6),
(10,1,2, random() * 48, random() * 100, 1, 1 , 1, 1, random() * 100 ,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100,  random() * 100, random() * 6)
;


