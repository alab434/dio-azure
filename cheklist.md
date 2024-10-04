# Checklist de diretrizes


### Tarefas Pendentes para transformação dos dados
- [ ] 1. Verifique os cabeçalhos e tipos de dados
- [ ] 2. Modifique os valores monetários para o tipo double preciso
- [ ] 3. Verifique a existência dos nulos e analise a remoção
- [ ] 4. Os employees com nulos em Super_ssn podem ser os gerentes. Verifique se há algum colaborador sem gerente
- [ ] 5. Verifique se há algum departamento sem gerente
- [ ] 6. Se houver departamento sem gerente, suponha que você possui os dados e preencha as lacunas
- [ ] 7. Verifique o número de horas dos projetos
- [ ] 8. Separar colunas complexas
- [ ] 9. Mesclar consultas employee e departament para criar uma tabela employee com o nome dos departamentos associados aos colaboradores. A mescla terá como base a tabela employee. Fique atento, essa informação influencia no tipo de junção
- [ ] 10. Neste processo elimine as colunas desnecessárias. 
- [ ] 11. Realize a junção dos colaboradores e respectivos nomes dos gerentes . Isso pode ser feito com consulta SQL ou pela mescla de tabelas com Power BI. Caso utilize SQL, especifique no README a query utilizada no processo.
- [ ] 12. Mescle as colunas de Nome e Sobrenome para ter apenas uma coluna definindo os nomes dos colaboradores
- [ ] 13. Mescle os nomes de departamentos e localização. Isso fará que cada combinação departamento-local seja único. Isso irá auxiliar na criação do modelo estrela em um módulo futuro.
- [ ] 14. Explique por que, neste caso supracitado, podemos apenas utilizar o mesclar e não o atribuir. 
- [ ] 15. Agrupe os dados a fim de saber quantos colaboradores existem por gerente
- [ ] 16. Elimine as colunas desnecessárias, que não serão usadas no relatório, de cada tabela


---

### Tarefas Concluídas
- [x] 1. Criação de uma instância na Azure para MySQL
- [x] 2. Criar o Banco de dados com base disponível no github
- [x] 3. Integração do Power BI com MySQL no Azure 
- [x] 4. Verificar problemas na base a fim de realizar a transformação dos dados

## Notas
- Observação item 4.:
a ordem de inserção dos dados do código sql fornecido foi alterada para possibilitar a correta correlação entre eles.
```
-- Inserção de dados na tabela employee
-- Insira primeiro o funcionário que não tem supervisor (Super_ssn = NULL)
-- Ele deve ser inserido primeiro porque não depende de nenhum outro funcionário na tabela.
insert into employee values 
('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1);

-- Agora insira os funcionários que têm James Borg (888665555) como supervisor.
-- Estes podem ser inseridos agora porque o supervisor já foi inserido.
insert into employee values 
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4);

-- Em seguida, insira os funcionários que têm Franklin Wong (333445555) como supervisor.
-- Agora que Franklin Wong já foi inserido, os funcionários que o têm como supervisor podem ser inseridos.
insert into employee values 
('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5);

-- Por fim, insira os funcionários que têm Jennifer Wallace (987654321) como supervisora.
-- Agora que Jennifer já foi inserida, esses funcionários podem ser adicionados.
insert into employee values 
('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4),
('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4);
```
