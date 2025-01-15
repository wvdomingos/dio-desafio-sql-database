-- Consulta para listar os clientes e seus veículos, juntamente com a quantidade de serviços realizados em suas ordens de serviço, considerando o status das ordens.
SELECT 
    c.Nome AS Cliente,
    v.Placa AS Veiculo,
    COUNT(os.idOrdemServico) AS Quantidade_OrdemServico,
    SUM(os.ValorTotal) AS Total_Orcamento,
    s.Descricao AS Status_Ordem
FROM 
    Cliente c
JOIN 
    Veiculo v ON c.idCliente = v.idCliente
LEFT JOIN 
    OrdemServico os ON v.idVeiculo = os.idVeiculo
LEFT JOIN 
    Status s ON os.idStatus = s.idStatus
GROUP BY 
    c.idCliente, v.idVeiculo, s.Descricao
HAVING 
    Quantidade_OrdemServico > 0
ORDER BY 
    Total_Orcamento DESC;

-- Consulta para listar os mecânicos e a quantidade de ordens de serviço que realizaram, incluindo a especialidade do mecânico e o total faturado por cada um.
SELECT 
    m.Nome AS Mecanico,
    m.Especialidade,
    COUNT(os.idOrdemServico) AS Quantidade_OrdemServico,
    SUM(os.ValorTotal) AS Total_Faturado
FROM 
    Mecanico m
JOIN 
    Equipe e ON m.idEquipe = e.idEquipe
JOIN 
    OrdemServico os ON e.idEquipe = os.idEquipe
GROUP BY 
    m.idMecanico
HAVING 
    Total_Faturado > 500
ORDER BY 
    Total_Faturado DESC;

-- Consulta para listar os serviços realizados nas ordens de serviço, com a quantidade de peças utilizadas e o valor total por serviço, usando o comando UNION.
SELECT 
    os.idOrdemServico,
    s.Descricao AS Servico,
    SUM(oss.Quantidade) AS Quantidade_Servico,
    SUM(s.Valor * oss.Quantidade) AS Valor_Total_Servico
FROM 
    OrdemServico os
JOIN 
    OrdemServico_has_Servico oss ON os.idOrdemServico = oss.idOrdemServico
JOIN 
    Servico s ON oss.idServico = s.idServico
GROUP BY 
    os.idOrdemServico, s.idServico
HAVING 
    Valor_Total_Servico > 100
UNION
SELECT 
    os.idOrdemServico,
    p.Descricao AS Peca,
    SUM(op.Quantidade) AS Quantidade_Peca,
    SUM(p.Valor * op.Quantidade) AS Valor_Total_Peca
FROM 
    OrdemServico os
JOIN 
    OrdemServico_has_Peca op ON os.idOrdemServico = op.idOrdemServico
JOIN 
    Peca p ON op.idPeca = p.idPeca
GROUP BY 
    os.idOrdemServico, p.idPeca
HAVING 
    Valor_Total_Peca > 50
ORDER BY 
    Valor_Total_Servico DESC;

-- Consulta para calcular a média de valor das ordens de serviço por cliente.
SELECT 
    c.Nome AS Cliente,
    AVG(os.ValorTotal) AS Media_Orcamento
FROM 
    Cliente c
JOIN 
    Veiculo v ON c.idCliente = v.idCliente
JOIN 
    OrdemServico os ON v.idVeiculo = os.idVeiculo
GROUP BY 
    c.idCliente
HAVING 
    Media_Orcamento > 200
ORDER BY 
    Media_Orcamento DESC;
