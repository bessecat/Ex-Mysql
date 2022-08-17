create database escola;
use escola;

create table professor(
	id int auto_increment,
	nome varchar(50) not null,
	disciplina varchar (50) not null,
	primary key(id)
);

create table turma(
	id int auto_increment,
	periodo varchar(20) not null,
	primary key(id)
);

create table aula(
	id int auto_increment,
	hora int not null,
	id_prof int not null,
	foreign key (id_prof) references professor(id),
	primary key(id)
);

create table aluno(
	id int auto_increment,
	nome varchar(50) not null,
	id_turma int not null,
	foreign key (id_turma) references turma(id),
	primary key(id)
);

create table aluno_aula(
	id_aula int not null,
	id_aluno int not null,
	primary key (id_aula,id_aluno),
	foreign key (id_aula) references aula(id),
	foreign key (id_aluno) references aluno(id)
);

create table prof_turma(
	id_professor int not null,
	id_turma int not null,
	primary key (id_professor,id_turma),
	foreign key (id_professor) references professor(id),
	foreign key (id_turma) references turma(id)
);

insert into professor
	values(1,"joao","historia"),
			(2,"maria","geografia");

insert into turma
	values(1,"matutino"),
			(2,"noturno");

insert into aula
	values(1,7,1),
			(2,19,2);

insert into aluno
	values(1,"jose",1),
			(2,"ana",2);

update professor
	set nome = "dani"
    where nome = "maria";
    
update turma
	set periodo = "vespertino"
    where periodo = "matutino";
    
update aula
	set hora = 7
    where hora = 8;
    
update aluno
	set nome = "pedro"
    where nome = "jose";
    
delete from professor
	where nome = "maria";
    
delete from turma
	where id = 2;
    
delete from aula
	where hora = 19;
    
delete from aluno
	where nome = "ana";