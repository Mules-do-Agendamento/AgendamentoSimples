CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL,
    TipoUsuario VARCHAR(20) NOT NULL
);

CREATE TABLE Profissional (
    IdProfissional INT PRIMARY KEY IDENTITY(1,1),
    Especialidade VARCHAR(100),
    IdUsuario INT NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY IDENTITY(1,1),
    Telefone VARCHAR(20),
    IdUsuario INT NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE Servico (
    IdServico INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(1000),
    Duracao INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    IdProfissional INT NOT NULL,
    FOREIGN KEY (IdProfissional) REFERENCES Profissional(IdProfissional)
);

CREATE TABLE Agendamento (
    IdAgendamento INT PRIMARY KEY IDENTITY(1,1),
    DataHora DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL,
    IdCliente INT NOT NULL,
    IdProfissional INT NOT NULL,
    IdServico INT NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
    FOREIGN KEY (IdProfissional) REFERENCES Profissional(IdProfissional),
    FOREIGN KEY (IdServico) REFERENCES Servico(IdServico)
);