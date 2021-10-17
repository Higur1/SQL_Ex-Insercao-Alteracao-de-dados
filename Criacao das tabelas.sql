USE Clinica

CREATE TABLE Especialidade(
ID							INT				PRIMARY KEY,
Especialidade				VARCHAR(100)	NOT NULL,
)

CREATE TABLE Paciente(
Num_Beneficiario			INT				PRIMARY KEY,
Nome						VARCHAR(100)	NOT NULL,
Logradouro					VARCHAR(200)	NOT NULL,
Numero						INT				NOT NULL,
CEP							CHAR(8)			NOT NULL,
Complemento					VARCHAR(255)	NOT NULL,
Telefone					VARCHAR(11)		NOT NULL
)

CREATE TABLE Medico(
Codigo						INT				PRIMARY KEY,
Nome						VARCHAR(100)	NOT NULL,
Logradouro					VARCHAR(200)	NOT NULL,
Numero						INT				NOT NULL,
CEP							CHAR(8)			NOT NULL,
Complemento					VARCHAR(255)	NOT NULL,
Contato						VARCHAR(11)		NOT NULL,
EspecialidadeID				INT				NOT NULL,

constraint FK_EspecialidadeID
	FOREIGN KEY(EspecialidadeID)
	REFERENCES Especialidade(ID)
)

CREATE TABLE Consulta(
PacienteNum_Beneficiario	INT				NOT NULL,
MedicoCodigo				INT				NOT NULL,
Data_hora					TIMESTAMP		PRIMARY KEY,
Observacao					VARCHAR(255)	NOT NULL,

constraint FK_PacienteNum_Beneficiario
	FOREIGN KEY(PacienteNum_Beneficiario)
	REFERENCES Paciente(Num_Beneficiario),

constraint FK_MedicoCodigo
	FOREIGN KEY(MedicoCodigo)
	REFERENCES Medico(codigo)
)

