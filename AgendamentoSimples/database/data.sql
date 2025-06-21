INSERT INTO Usuario (Nome, Email, Senha, TipoUsuario) VALUES
('Admin', 'admin@email.com', '123', 'Admin'),
('Carlos Silva', 'carlos.s@email.com', '123', 'Profissional'),
('Ana Costa', 'ana.c@email.com', '123', 'Profissional'),
('Marcos Rocha', 'marcos.r@email.com', '123', 'Profissional'),
('Beatriz Lima', 'bia.l@email.com', '123', 'Profissional'),
('Lucas Mendes', 'lucas.m@email.com', '123', 'Profissional'),
('Roberto Almeida', 'roberto.a@email.com', '123', 'Cliente'),
('Maria Oliveira', 'maria.o@email.com', '123', 'Cliente'),
('Joana Lima', 'joana.l@email.com', '123', 'Cliente'),
('Fernando Braga', 'fernando.b@email.com', '123', 'Cliente'),
('Patricia Neves', 'patricia.n@email.com', '123', 'Cliente');

INSERT INTO Profissional (Especialidade, IdUsuario) VALUES
('Cardiologista', 2),
('Dentista', 3),
('Personal Trainer', 4),
('Fisioterapeuta', 5),
('Barbeiro', 6);

INSERT INTO Cliente (Telefone, IdUsuario) VALUES
('11988887777', 7),
('21977776666', 8),
('31966665555', 9),
('41955554444', 10),
('51944443333', 11);

INSERT INTO Servico (Nome, Descricao, Duracao, Valor, IdProfissional) VALUES
('Consulta de Rotina', 'Consulta geral para avaliação cardíaca.', 60, 300.00, 1),
('Limpeza Dental', 'Limpeza completa dos dentes.', 50, 200.00, 2),
('Treino Personalizado', 'Montagem e acompanhamento de treino.', 60, 150.00, 3),
('Sessão de Fisioterapia', 'Sessão para reabilitação muscular.', 45, 180.00, 4),
('Corte Masculino', 'Corte de cabelo e finalização.', 40, 50.00, 5);

INSERT INTO Agendamento (DataHora, Status, IdCliente, IdProfissional, IdServico) VALUES
('2025-09-10 10:00:00', 'Confirmado', 1, 1, 1),
('2025-09-11 15:00:00', 'Confirmado', 2, 2, 2),
('2025-09-12 08:00:00', 'Pendente', 3, 3, 3),
('2025-09-13 11:30:00', 'Realizado', 4, 4, 4),
('2025-09-14 18:00:00', 'Cancelado', 5, 5, 5);
