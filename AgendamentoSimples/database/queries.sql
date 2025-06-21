-- 1. Lista todos os profissionais e suas especialidades, em ordem alfabética.
SELECT U.Nome, P.Especialidade FROM Profissional AS P JOIN Usuario AS U ON P.IdUsuario = U.IdUsuario ORDER BY U.Nome;

-- 2. Mostra os detalhes dos agendamentos que estão com status 'Confirmado'.
SELECT A.DataHora, C.Nome AS NomeCliente, P.Nome AS NomeProfissional, S.Nome AS Servico FROM Agendamento AS A JOIN Cliente AS Cl ON A.IdCliente = Cl.IdCliente JOIN Usuario AS C ON Cl.IdUsuario = C.IdUsuario JOIN Profissional AS Pr ON A.IdProfissional = Pr.IdProfissional JOIN Usuario AS P ON Pr.IdUsuario = P.IdUsuario JOIN Servico AS S ON A.IdServico = S.IdServico WHERE A.Status = 'Confirmado' ORDER BY A.DataHora;

-- 3. Conta o número total de agendamentos por profissional.
SELECT P.Nome AS NomeProfissional, COUNT(A.IdAgendamento) AS TotalAgendamentos FROM Agendamento AS A JOIN Profissional AS Pr ON A.IdProfissional = Pr.IdProfissional JOIN Usuario AS P ON Pr.IdUsuario = P.IdUsuario GROUP BY P.Nome ORDER BY TotalAgendamentos DESC;

-- 4. Calcula o valor total faturado por cada profissional (apenas de serviços 'Realizado').
SELECT P.Nome AS NomeProfissional, SUM(S.Valor) AS FaturamentoTotal FROM Agendamento AS A JOIN Servico AS S ON A.IdServico = S.IdServico JOIN Profissional AS Pr ON A.IdProfissional = Pr.IdProfissional JOIN Usuario AS P ON Pr.IdUsuario = P.IdUsuario WHERE A.Status = 'Realizado' GROUP BY P.Nome;

-- 5. Exibe os 3 serviços com maior valor.
SELECT TOP 3 Nome, Valor FROM Servico ORDER BY Valor DESC;

-- 6. Encontra todos os usuários cujo nome começa com a letra 'M'.
SELECT Nome, TipoUsuario FROM Usuario WHERE Nome LIKE 'M%';

-- 7. Calcula o preço médio dos serviços oferecidos no sistema.
SELECT AVG(Valor) AS PrecoMedioGeral FROM Servico;

-- 8. Mostra os clientes que não possuem nenhum agendamento cancelado.
SELECT U.Nome, U.Email FROM Cliente AS C JOIN Usuario AS U ON C.IdUsuario = U.IdUsuario WHERE C.IdCliente NOT IN (SELECT IdCliente FROM Agendamento WHERE Status = 'Cancelado');

-- 9. Lista os profissionais que tiveram mais de 1 agendamento.
SELECT P.Nome AS NomeProfissional, COUNT(A.IdAgendamento) AS TotalAgendamentos FROM Agendamento AS A JOIN Profissional AS Pr ON A.IdProfissional = Pr.IdProfissional JOIN Usuario AS P ON Pr.IdUsuario = P.IdUsuario GROUP BY P.Nome HAVING COUNT(A.IdAgendamento) > 1;

-- 10. Mostra o agendamento mais antigo registrado no sistema.
SELECT TOP 1 * FROM Agendamento ORDER BY DataHora ASC;