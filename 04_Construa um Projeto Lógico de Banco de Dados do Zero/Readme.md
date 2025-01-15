# Desafio Oficina Mecânica - Construa um Projeto Lógico de Banco de Dados do Zero 

Este projeto consiste na criação de um esquema lógico de banco de dados para uma oficina mecânica, incluindo a definição do modelo relacional, a implementação do esquema no banco de dados e a criação de queries SQL avançadas para recuperar, manipular e analisar dados. O banco de dados gerencia informações sobre clientes, veículos, ordens de serviço, serviços realizados, peças utilizadas, equipes e mecânicos, com foco em facilitar a gestão das operações da oficina.

## Descrição do Projeto

O projeto envolve as seguintes etapas:

1. **Modelagem Conceitual**: A modelagem do banco de dados foi realizada utilizando o modelo Entidade-Relacionamento (ER) para representar as entidades e seus relacionamentos no contexto de uma oficina mecânica. As principais entidades incluem `Cliente`, `Veiculo`, `OrdemServico`, `Servico`, `Peca`, `Equipe`, `Mecanico`, entre outras.
   
2. **Esquema Lógico**: A partir do modelo ER, foi criado o esquema lógico relacional, definindo as tabelas, seus atributos e os relacionamentos entre elas. As chaves primárias, chaves estrangeiras e restrições de integridade foram aplicadas para garantir a consistência dos dados.

3. **Implementação do Banco de Dados**: O banco de dados foi implementado utilizando SQL, criando as tabelas conforme o esquema lógico, com suas respectivas colunas, tipos de dados e relacionamentos. Além disso, foram inseridos dados de exemplo para permitir testes.

4. **Consultas SQL**: Para testar o banco de dados e fornecer respostas analíticas, foram criadas várias consultas SQL que utilizam cláusulas como `SELECT`, `WHERE`, `ORDER BY`, `HAVING`, `JOIN`, e expressões para calcular atributos derivados. As consultas abordam questões complexas como o total de faturamento por mecânico, a quantidade de ordens de serviço por cliente e os serviços realizados em cada ordem.

## Estrutura do Projeto

### 1. **Modelo Relacional**

O esquema lógico é composto pelas seguintes tabelas:

- **Cliente**: Armazena informações dos clientes, incluindo nome, CPF, endereço e telefone.
- **Veiculo**: Contém dados sobre os veículos dos clientes, como placa, modelo, marca e ano.
- **OrdemServico**: Registra as ordens de serviço realizadas, com informações sobre o status, valor total e datas de emissão e conclusão.
- **Servico**: Define os serviços disponíveis na oficina, com descrição e valor.
- **Peca**: Contém dados sobre as peças utilizadas nas ordens de serviço.
- **Equipe**: Representa as equipes da oficina, cada uma composta por um ou mais mecânicos.
- **Mecanico**: Armazena as informações dos mecânicos, incluindo nome, especialidade e a equipe a qual pertencem.
- **Status**: Contém o status das ordens de serviço, como "Em Andamento" e "Concluído".

### 2. **Criação das Tabelas e Relacionamentos**

O esquema lógico foi implementado utilizando SQL para criar as tabelas e os relacionamentos entre elas. Abaixo está um resumo das principais relações entre as tabelas:

- **Cliente -> Veiculo**: Um cliente pode ter vários veículos, mas cada veículo pertence a um único cliente.
- **OrdemServico -> Veiculo**: Cada ordem de serviço está associada a um veículo.
- **OrdemServico -> Status**: Cada ordem de serviço tem um status (Em Andamento, Concluído).
- **OrdemServico -> Equipe**: Cada ordem de serviço é realizada por uma equipe.
- **OrdemServico_has_Servico**: Relaciona as ordens de serviço com os serviços realizados, incluindo a quantidade de cada serviço.
- **OrdemServico_has_Peca**: Relaciona as ordens de serviço com as peças utilizadas, incluindo a quantidade de cada peça.

### 3. **Queries SQL Criadas**

Foram desenvolvidas diversas queries SQL complexas que utilizam as cláusulas mencionadas no desafio. Exemplos de perguntas que podem ser respondidas pelas consultas incluem:

- Quais são os clientes e seus veículos, juntamente com o total de ordens de serviço realizadas e o valor total faturado?
- Quais mecânicos realizaram mais ordens de serviço e qual o valor total faturado por cada um?
- Qual a quantidade de serviços realizados em cada ordem de serviço e o valor total de cada serviço/peça?
- Qual é a média de valor das ordens de serviço por cliente?

### 4. **Exemplo de Consultas**

Aqui estão alguns exemplos de consultas SQL criadas:

- **Consulta de Clientes e Veículos**:
  ```sql
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
  ```

- **Consulta de Mecânicos e Faturamento**:
  ```sql
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
  ```

### 5. **Instalação e Execução**

1. Clone o repositório para sua máquina local:
   ```bash
   git clone https://github.com/wvdomingos/dio-desafio-sql-database
   ```

2. Importe o script de criação do banco no seu ambiente MySQL.
3. Execute o script de inserção de dados fictícios.
4. Utilize o script de consultas para responder às perguntas levantadas ou criar suas próprias queries.

## Estrutura do Repositório
- `modelo/`: Contém o diagrama EER.
- `scripts/`: Scripts SQL para criação, inserção e consultas.
- `README.md`: Documentação do projeto.

## Contribuição
Sugestões e melhorias são bem-vindas! Abra uma issue ou envie um pull request para contribuir.

## Licença
Este projeto está licenciado sob a MIT License - veja o arquivo LICENSE para mais detalhes.