drop table departament;

-- Passo 1: Criar a tabela com Dnumber como chave primária
create table departament(
    Dname varchar(15) not null,
    Dnumber int not null primary key, -- Definir Dnumber como chave primária
    Mgr_ssn char(9) not null,
    Mgr_start_date date, 
    Dept_create_date date
);

-- Passo 2: Inserir os dados
insert into departament values 
('Research', 5, '333445555', '1988-05-22', '1986-05-22'),
('Administration', 4, '987654321', '1995-01-01', '1994-01-01'),
('Headquarters', 1, '888665555', '1981-06-19', '1980-06-19');

-- Passo 3: Adicionar as demais constraints
-- Restrição única na coluna Dname
alter table departament
    add constraint unique_name_dept unique(Dname);

-- Chave estrangeira na coluna Mgr_ssn, com ON UPDATE CASCADE
alter table departament
    add constraint fk_dept foreign key (Mgr_ssn) references employee(Ssn)
    on update cascade;

-- Adicionar check constraint (garantir que Dept_create_date < Mgr_start_date)
alter table departament
    add constraint chk_date_dept check (Dept_create_date < Mgr_start_date);
