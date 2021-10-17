

--Inserindo dados da tabela Especialidade	
INSERT INTO Especialidade(ID, Especialidade)
VALUES (1, 'Urologista'),
	   (2, 'Urologista'),
	   (3, 'Geriatra'),
	   (4, 'Pediatra')

--Inserindo dados da tabela Paciente	
INSERT INTO Paciente(Num_Beneficiario, Nome, Logradouro, Numero, CEP, Complemento, Telefone)
Values(99901, 'Washington Silva', 'R.Anhaia', 150, 02345000, 'Casa', 922229999),
	 (99902, 'Luis Ricardo', 'R.Voluntários da Pátria', 2251, 03254010, 'Bloco B.Apto 25', 923450987),
	 (99903, 'Maria Elisa', 'Av.Aguia de Haia', 1188, 06987020, 'Apto 1208', 912348765),
	 (99904, 'José Araujo', 'R.XV de Novembro', 18, 03678000, 'Casa', 945674321),
	 (99905, 'Joana Paula', 'R.7 de Abril', 97, 01214000, 'Conjunto 3 - Apto 801', 912095674) 
	 
--Inserindo dados da tabela Medico
INSERT INTO Medico(Codigo, Nome, Logradouro, Numero, CEP, Complemento, Contato, EspecialidadeID)
Values(100001, 'Ana Paula', 'R. 7 de Setembro', 256, 03698000, 'Casa', 915689456, 1),
	  (100002, 'Maria Aparecida', 'Av.Brasil', 32, 02145070, 'Casa', 923235454, 1),
	  (100003, 'Lucas Borges', 'Av. do Estado', 3210, 05241000, 'Apto 205', 963698585, 2),
	  (100004, 'Gabriel Oliveira', 'Av.Dom Helder Camara', 350, 03145000, 'Apto 602', 932458745, 3)

--Inserindo dados da tabela Consulta	  
INSERT INTO Consulta(PacienteNum_Beneficiario, MedicoCodigo, Data_hora, Observacao)
Values(99901, 2, '2021/09/04 13:20', 'Infecção Urina'),
	  (99902, 3, '2021/09/04 13:15', 'Gripe'),
	  (99901, 1, '2021/09/04 12:30', 'Infecção Garganta')

--Adicionando a coluna atendimento na tabela Medico
ALTER TABLE Medico add Dia_Atendimento VARCHAR(10) NULL

--Atualizando os dias de atendimento
UPDATE Medico
	SET Dia_Atendimento = '2º feira'
	WHERE Codigo = 100001;
UPDATE Medico
	SET Dia_Atendimento = '4º feira'
	WHERE Codigo = 100002
UPDATE Medico
	SET Dia_Atendimento = '2º feira'
	WHERE Codigo = 100003;
UPDATE Medico
	SET Dia_Atendimento = '5º feira'
	WHERE Codigo = 100004;

--Deletando a especialidade Pediatra
DELETE FROM Especialidade
WHERE Especialidade = 'Pediatra';

--Alterando o nome da coluna Dia_Atendimento
EXEC sp_rename 'dbo.Medico.Dia_Atendimento', 'dia_semana_atendimento'

--Alterando dados do Médico Lucas Borges
UPDATE Medico
	SET Logradouro = 'Av. Bras Leme', Numero = 876, Complemento = 'Apto 504', CEP = 02122000
	WHERE Nome = 'Lucas Borges';


--Alterar o tipo da coluna observação
ALTER TABLE Consulta
	ALTER COLUMN Observacao VARCHAR(200)