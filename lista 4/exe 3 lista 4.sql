create database escola;
use escola;

create table instrutores (
  id int not null auto_increment,
  nome varchar(50) not null,
  email varchar(50) not null,
  valor_hora integer unsigned null,
  certificados varchar(255) null,
  primary key(id)
);
create table cursos (
  id integer unsigned not null auto_increment,
  nome varchar(50) not null,
  requisito varchar(255) null,
  carga_horaria smallint unsigned null,
  preco double unsigned null,
  primary key(id)
);
 
create table alunos (
  id int not null auto_increment,
  cpf char(11) not null,
  nome varchar(50) not null,
  email varchar(50) not null,
  fone char(14) not null,
  data_nascimento date null,
  primary key(id)
);
 
create table turmas (
  id integer unsigned not null auto_increment,
  instrutores_id int not null,
  cursos_id integer unsigned not null,
  data_inicio date null,
  data_final date null,
  carga_horaria smallint unsigned null,
  primary key(id),
  index turmas_fkindex1(cursos_id),
  index turmas_fkindex2(instrutores_id),
  constraint curso_turma_fk foreign key(cursos_id)
    references cursos(id),
  constraint instrutor_turma_fk foreign key(instrutores_id)
    references instrutores(id)
);
 
create table matriculas (
  id integer unsigned not null auto_increment,
  turmas_id integer unsigned not null,
  alunos_id int not null,
  data_matricula date null,
  primary key(id),
   constraint aluno_matricula_fk foreign key(alunos_id)
    references alunos(id),
  constraint turma_matricula_fk foreign key(turmas_id)
    references turmas(id)
);

-- /////////////////////// inserts ////////////////////////// --
insert into instrutores
set
nome = "joao",
email = "joao@mail.com",
valor_hora = "20",
certificados = "certificado";

insert into instrutores
set
nome = "maria",
email = "maria@mail.com",
valor_hora = "20",
certificados = "certificadoo";

insert into cursos
set
nome = "connect",
requisito = "logica",
carga_horaria = "6",
preco = "0";

insert into cursos
set
nome = "farmacia",
requisito = "quimica basica",
carga_horaria = "9",
preco = "0";

insert into alunos
set
cpf = "000000000",
nome = "daniella",
email ="dani@mail.com", 
fone = "44998755084",
data_nascimento = "1996-05-20";

insert into alunos
set
cpf = "10000000",
nome = "ana",
email ="ana@mail.com", 
fone = "45998775588",
data_nascimento = "1994-06-07";

insert into alunos
set
cpf = "20000000",
nome = "marcos",
email ="marcos@mail.com", 
fone = "44998763046",
data_nascimento = "2001-07-18";

insert into turmas 
set
instrutores_id = 1,
cursos_id = 1,
data_inicio = "2022-06-27",
data_final = "2022-12-20",
carga_horaria = 10;



insert into matriculas
set
turmas_id = 1,
alunos_id = 1,
data_matricula = "2022-06-20";

insert into matriculas
set
turmas_id = 2,
alunos_id = 2,
data_matricula = "2020-06-20";

update instrutores set
nome = 'cleiton',
email = 'cleitinho@mail.com'
where id = '1';

update cursos set
nome = "biopark";