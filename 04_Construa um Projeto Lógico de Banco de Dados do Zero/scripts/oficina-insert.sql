USE oficina;

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, CPF, Endereco, Telefone) VALUES
('João Silva', '12345678900', 'Rua A, 123', '(11) 98765-4321'),
('Maria Oliveira', '98765432100', 'Rua B, 456', '(21) 91234-5678'),
('Carlos Souza', '45612378900', 'Rua C, 789', '(31) 99876-5432');

SELECT * FROM Cliente;

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (Placa, Modelo, Marca, Ano, idCliente) VALUES
('ABC1234', 'Civic', 'Honda', '2018', 1),
('DEF5678', 'Corolla', 'Toyota', '2020', 2),
('GHI9101', 'Uno', 'Fiat', '2015', 3);

-- Inserindo dados na tabela Equipe
INSERT INTO Equipe (NomeEquipe) VALUES
('Equipe A'),
('Equipe B');

-- Inserindo dados na tabela Mecanico
INSERT INTO Mecanico (Nome, Endereco, Especialidade, idEquipe) VALUES
('Pedro Santos', 'Rua D, 101', 'Motor', 1),
('Ana Paula', 'Rua E, 202', 'Suspensão', 2),
('José Almeida', 'Rua F, 303', 'Freios', 1);

-- Inserindo dados na tabela OrdemServico
INSERT INTO OrdemServico (idStatus, Descricao, ValorTotal, DataEmissao, DataConclusao, idVeiculo, idEquipe) VALUES
(1, 'Revisão Geral', 1500.00, '2025-01-10', NULL, 1, 1),
(2, 'Troca de Óleo', 250.00, '2025-01-05', '2025-01-07', 2, 2),
(1, 'Alinhamento', 300.00, '2025-01-12', NULL, 3, 1);

-- Inserindo dados na tabela Servico
INSERT INTO Servico (Descricao, Valor) VALUES
('Troca de óleo', 250.00),
('Revisão geral', 1500.00),
('Alinhamento', 300.00);

-- Inserindo dados na tabela Peca
INSERT INTO Peca (Descricao, Valor) VALUES
('Filtro de óleo', 50.00),
('Pastilha de freio', 200.00),
('Amortecedor', 500.00);

-- Inserindo dados na tabela OrdemServico_has_Servico
INSERT INTO OrdemServico_has_Servico (idOrdemServico, idServico) VALUES
(1, 2),
(2, 1),
(3, 3);

-- Inserindo dados na tabela OrdemServico_has_Peca
INSERT INTO OrdemServico_has_Peca (idOrdemServico, idPeca) VALUES
(1, 1),
(2, 2),
(3, 3);
