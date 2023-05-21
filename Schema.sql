create table player(
  id serial,
  first_name varchar,
  last_name varchar,
  primary key(id)
  );
  
  insert into player (first_name,last_name) values
  ('Kawhi', 'Leonard')
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
   ('Toronto Raptors'), ('Los Angeles Clippers'), ('Los Angeles Lakers')
   ;
    
  create table player_team_role(
    player_id integer,
    team_id integer,
    role_id integer,
    constraint fk_player_id foreign key(player_id) references player(id), 
    constraint fk_team_id foreign key(team_id) references team(id), 
    constraint fk_role foreign key(role_id) references roles(id)
  );
  
  insert into player_team_role(player_id,team_id, role_id) values
  (1,1,1)
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
 
insert into game_teams(team_one_id , team_two_id,home_team) values
	(3,2,2)
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
 
 
 create table player_game_MP(
  	id serial,
    primary key(id),
	player_id integer,
    minutes_played integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
    );
   	
 insert into player_game_MP(player_id,minutes_played) values
 	(1,32);
 
 create table player_game_FG(
    id serial,
    primary key(id),
	player_id integer,
    field_goals_made integer,
    field_goals_attempted integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
    );
   	
 insert into player_game_FG(player_id,field_goals_made,field_goals_attempted) values
 	(1,14,24);
 
 create table player_game_3P(
    id serial,
    primary key(id),
	player_id integer,
    three_point integer,
    three_point_attempted integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
    );
   	
 insert into player_game_3P(player_id,three_point,three_point_attempted) values
 	(1,12,32);
 
create table player_game_FT(
    id serial,
    primary key(id),
	player_id integer,
    free_throws_made integer,
    free_throws_attempted integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
    );
   	
 insert into player_game_FT(player_id,free_throws_made,free_throws_attempted) values
 	(1,5,7);
    
 create table player_game_RB(
    id serial,
    primary key(id),
	player_id integer,
    offensive_rebound integer,
    defensive_rebound integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
   );
   	
 insert into player_game_RB(player_id,offensive_rebound,defensive_rebound) values
 	(1,12,192200);
    
  create table player_game_AST(
    id serial,
    primary key(id),
	player_id integer,

    assists integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
   );
   	
 insert into player_game_AST(player_id,assists) values
 	(1,2910);
    
 create table player_game_STL(
    id serial,
    primary key(id),
	player_id integer,
    steals integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
   );
   	
 insert into player_game_STL(player_id,steals) values
 	(1,1);
    
   create table player_game_BLK(
    id serial,
    primary key(id),
	player_id integer,
    blocks integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
   );
   	
 insert into player_game_BLK(player_id,blocks) values
 	(1,666666666);
    
  create table player_game_TOV(
    id serial,
    primary key(id),
	player_id integer,
    turnovers integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
   );
   	
 insert into player_game_TOV(player_id,turnovers) values
 	(1,67);
    
   create table player_game_PF(
    id serial,
    primary key(id),
	player_id integer,
    personal_fouls integer,
   	constraint fk_player_id foreign key(player_id) references player(id)
   );
   	
 insert into player_game_PF(player_id,personal_fouls) values
 	(1,6);

create table game_scoreboard(
  id serial,
  primary key(id),
  player_id integer,
  mp_id integer,
  fg_id integer,
  tp_id integer,
  ft_id integer,
  rb_id integer,
  ast_id integer,
  stl_id integer,
  blk_id integer,
  tov_id integer,
  pf_id integer,
  constraint fk_mp_id foreign key(mp_id) references player_game_MP(id),
  constraint fk_fg_id foreign key(fg_id) references player_game_FG(id),
  constraint fk_tp_id foreign key(tp_id) references player_game_3P(id),
  constraint fk_ft_id foreign key(ft_id) references player_game_FT(id),
  constraint fk_rb_id foreign key(rb_id) references player_game_RB(id),
  constraint fk_ast_id foreign key(ast_id) references player_game_AST(id),
  constraint fk_stl_id foreign key(stl_id) references player_game_STL(id),
  constraint fk_blk_id foreign key(blk_id) references player_game_BLK(id),
  constraint fk_tov_id foreign key(tov_id) references player_game_TOV(id),
  constraint fk_pf_id foreign key(pf_id) references player_game_PF(id)
);
  


   
  




