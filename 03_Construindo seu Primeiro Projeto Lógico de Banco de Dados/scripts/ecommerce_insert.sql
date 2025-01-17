-- MySQL Script generated by MySQL Workbench
-- Wed Jan 15 14:23:34 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `ecommerce`.`Produto`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Produto` (`Categoria`, `Descricao`, `Valor`) VALUES
('Eletrônicos', 'Smartphone', 1200.50),
('Eletrodomésticos', 'Geladeira', 2500.00),
('Móveis', 'Sofá', 800.00),
('Ferramentas', 'Furadeira', 300.00);

-- -----------------------------------------------------
-- Table `ecommerce`.`Fornecedor`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Fornecedor` (`RazaoSocial`, `CNPJ`, `Contato`) VALUES
('Tech Supplies Ltda', '12345678000190', 'João Silva'),
('Home Goods SA', '98765432000109', 'Maria Oliveira'),
('Tools & More', '11223344000155', 'Carlos Mendes');

-- -----------------------------------------------------
-- Table `ecommerce`.`Produtos_Fornecedor`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Produtos_Fornecedor` (`Fornecedor_idFornecedor`, `Produto_idProduto`, `Quantidade`) VALUES
(1, 1, 50),
(2, 2, 20),
(3, 3, 10),
(1, 4, 100);

-- -----------------------------------------------------
-- Table `ecommerce`.`Estoque`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Estoque` (`Local`, `Quantidade`) VALUES
('Central', 500),
('Filial Norte', 200),
('Filial Sul', 300);

-- -----------------------------------------------------
-- Table `ecommerce`.`Produtos_Estoque`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Produtos_Estoque` (`Produto_idProduto`, `Estoque_idEstoque`, `Localizacao`) VALUES
(1, 1, 'Corredor A1'),
(2, 2, 'Corredor B2'),
(3, 3, 'Corredor C3'),
(4, 1, 'Corredor D4');

-- -----------------------------------------------------
-- Table `ecommerce`.`Cliente`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Cliente` (`Nome`, `Endereco`, `CPF`, `Dt_Nascimento`) VALUES
('Ana Souza', 'Rua das Flores, 123', '12345678901', '1990-05-15'),
('Bruno Lima', 'Avenida Paulista, 456', '98765432100', '1985-08-20'),
('Carla Nunes', 'Rua das Palmeiras, 789', '45678912300', '1992-12-10');

-- -----------------------------------------------------
-- Table `ecommerce`.`Pedido`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Pedido` (`StatusPedido`, `Descricao`, `Frete`, `Cliente_idCliente`) VALUES
('Em Andamento', 'Pedido de Eletrônicos', 15.00, 1),
('Enviado', 'Pedido de Móveis', 50.00, 2),
('Entregue', 'Pedido de Ferramentas', 30.00, 3);

-- -----------------------------------------------------
-- Table `ecommerce`.`Produtos_Pedido`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Produtos_Pedido` (`Pedido_idPedido`, `Produto_idProduto`, `Quantidade`, `Status`) VALUES
(1, 1, 2, 'Disponivel'),
(2, 3, 1, 'Disponivel'),
(3, 4, 5, 'Disponivel');

-- -----------------------------------------------------
-- Table `ecommerce`.`Vendedor`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Vendedor` (`RazaoSocial`, `Local`, `NomeFantasia`, `CNPJ`, `CPF`) VALUES
('Eletronics Distributors Ltda', 'São Paulo', 'E-Distrib', '56789012345678', '12345678901'),
('HomeStyle SA', 'Rio de Janeiro', 'HS Distrib', '98765432109876', '98765432100');

-- -----------------------------------------------------
-- Table `ecommerce`.`Produtos_Vendedores`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`Produtos_Vendedores` (`Vendedor_idVendedor`, `Produto_idProduto`, `Quantidade`) VALUES
(1, 1, 30),
(1, 2, 10),
(2, 3, 20),
(2, 4, 15);