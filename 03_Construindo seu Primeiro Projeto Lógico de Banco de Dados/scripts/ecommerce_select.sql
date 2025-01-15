-- Consultas SQL para o banco de dados "ecommerce"
use ecommerce

-- 1. Lista todos os produtos disponíveis com suas categorias e valores
SELECT idProduto, Categoria, Descricao, Valor
FROM ecommerce.Produto;

-- 2. Retorna a quantidade total de produtos fornecidos por cada fornecedor
SELECT f.RazaoSocial, SUM(pf.Quantidade) AS Total_Produtos
FROM ecommerce.Fornecedor f
JOIN ecommerce.Produtos_Fornecedor pf ON f.idFornecedor = pf.Fornecedor_idFornecedor
GROUP BY f.RazaoSocial;

-- 3. Consulta o estoque total agrupado por local de armazenamento
SELECT * FROM ecommerce.Estoque;
SELECT * FROM ecommerce.Produtos_Estoque;

SELECT e.Local, SUM(e.Quantidade) AS Total_Em_Estoque
FROM ecommerce.Estoque e
JOIN ecommerce.Produtos_Estoque pe ON e.idEstoque = pe.Estoque_idEstoque
GROUP BY e.Local;

-- 4. Lista todos os pedidos realizados por clientes, incluindo status e valores de frete
SELECT p.idPedido, p.StatusPedido, p.Descricao, p.Frete, c.Nome AS Cliente
FROM ecommerce.Pedido p
JOIN ecommerce.Cliente c ON p.Cliente_idCliente = c.idCliente;

-- 5. Retorna o total de pedidos por cliente
SELECT c.Nome, COUNT(p.idPedido) AS Total_Pedidos
FROM ecommerce.Cliente c
LEFT JOIN ecommerce.Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.Nome;

-- 6. Verifica os produtos de cada pedido, incluindo a quantidade e status de disponibilidade
SELECT pp.Pedido_idPedido, pr.Descricao AS Produto, pp.Quantidade, pp.Status
FROM ecommerce.Produtos_Pedido pp
JOIN ecommerce.Produto pr ON pp.Produto_idProduto = pr.idProduto;

-- 7. Consulta os vendedores e os produtos que eles oferecem
SELECT v.RazaoSocial, pr.Descricao AS Produto, pv.Quantidade
FROM ecommerce.Vendedor v
JOIN ecommerce.Produtos_Vendedores pv ON v.idVendedor = pv.Vendedor_idVendedor
JOIN ecommerce.Produto pr ON pv.Produto_idProduto = pr.idProduto;

-- 8. Lista os clientes que possuem mais de 2 pedidos
SELECT c.Nome, COUNT(p.idPedido) AS Total_Pedidos
FROM ecommerce.Cliente c
JOIN ecommerce.Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.Nome
HAVING COUNT(p.idPedido) > 2;

-- 9. Retorna os produtos mais vendidos (com base na soma das quantidades em pedidos)
SELECT pr.Descricao AS Produto, SUM(pp.Quantidade) AS Total_Vendido
FROM ecommerce.Produtos_Pedido pp
JOIN ecommerce.Produto pr ON pp.Produto_idProduto = pr.idProduto
GROUP BY pr.Descricao
ORDER BY Total_Vendido DESC;

-- 10. União de produtos em estoque e produtos fornecidos por fornecedores
SELECT pr.idProduto, pr.Descricao, 'Estoque' AS Origem
FROM ecommerce.Produto pr
JOIN ecommerce.Produtos_Estoque pe ON pr.idProduto = pe.Produto_idProduto
UNION
SELECT pr.idProduto, pr.Descricao, 'Fornecedor' AS Origem
FROM ecommerce.Produto pr
JOIN ecommerce.Produtos_Fornecedor pf ON pr.idProduto = pf.Produto_idProduto;

-- 11. Consulta detalhada dos pedidos com os valores totais (frete + produtos)
SELECT p.idPedido, c.Nome AS Cliente, p.Frete, SUM(pp.Quantidade * pr.Valor) AS Valor_Produtos, 
       (p.Frete + SUM(pp.Quantidade * pr.Valor)) AS Valor_Total
FROM ecommerce.Pedido p
JOIN ecommerce.Cliente c ON p.Cliente_idCliente = c.idCliente
JOIN ecommerce.Produtos_Pedido pp ON p.idPedido = pp.Pedido_idPedido
JOIN ecommerce.Produto pr ON pp.Produto_idProduto = pr.idProduto
GROUP BY p.idPedido;

-- 12. Produtos fora de estoque
SELECT pr.Descricao AS Produto, pr.*, pe.*
FROM ecommerce.Produto pr
LEFT JOIN ecommerce.Produtos_Estoque pe ON pr.idProduto = pe.Produto_idProduto;

-- 13. Consultas de clientes que ainda não realizaram pedidos
SELECT c.Nome AS Cliente
FROM ecommerce.Cliente c
LEFT JOIN ecommerce.Pedido p ON c.idCliente = p.Cliente_idCliente
WHERE p.idPedido IS NULL;

-- 14. Produtos disponíveis com mais de uma localização no estoque
SELECT pr.Descricao AS Produto, COUNT(pe.Estoque_idEstoque) AS Locais
FROM ecommerce.Produto pr
JOIN ecommerce.Produtos_Estoque pe ON pr.idProduto = pe.Produto_idProduto
GROUP BY pr.Descricao
HAVING COUNT(pe.Estoque_idEstoque) > 1;
