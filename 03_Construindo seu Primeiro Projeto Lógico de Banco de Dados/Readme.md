# Desafio de Projeto: Construindo seu Primeiro Projeto Lógico de Banco de Dados

## Descrição do Projeto
Este projeto tem como objetivo criar e implementar um banco de dados para um sistema de e-commerce, contemplando desde a modelagem conceitual até a execução de consultas SQL complexas. Este desafio explora conceitos de modelagem EER, criação de esquemas lógicos e físicos, inserção de dados e elaboração de queries para extração e análise de informações.

## Cenário
O sistema de e-commerce modelado permite:

- Cadastro de clientes, com suporte a Pessoa Física (PF) e Pessoa Jurídica (PJ).
- Gerenciamento de produtos, fornecedores e estoques.
- Registro de pedidos com informações sobre formas de pagamento e status de entrega.
- Relacionamento entre vendedores e fornecedores.

## Objetivos Específicos
1. Refinar o modelo conceitual e lógico para incluir:
   - Diferenciação entre clientes PF e PJ.
   - Cadastro de múltiplas formas de pagamento por cliente.
   - Status e código de rastreio para entregas.
2. Criar o script SQL para:
   - Definição do esquema do banco de dados.
   - Inserção de dados fictícios para testes.
   - Consultas SQL complexas atendendo às necessidades do cenário.

## Implementação

### Modelagem
O modelo EER (Entity-Relationship) foi refinado para atender às novas necessidades do cenário, incluindo relacionamentos complexos e constraints entre as entidades principais:

- **Cliente**: Permite o cadastro de PF e PJ, diferenciados por atributos específicos.
- **Pedido**: Inclui status, descrição e relação com formas de pagamento e entrega.
- **Entrega**: Com status de entrega e código de rastreio.
- **Pagamento**: Suporte a diversas formas de pagamento.

### Scripts
1. **Criação de Esquema**: Script para criação de tabelas com definição de chaves primárias, estrangeiras e constraints.
2. **População de Dados**: Script para inserção de dados fictícios, permitindo a validação do esquema e a execução de consultas.
3. **Consultas SQL**:
   - Recuperações simples (SELECT, WHERE, ORDER BY).
   - Uso de atributos derivados e agregados.
   - Filtragem por grupos (HAVING).
   - Junções (JOIN) entre tabelas para análise complexa.

### Exemplos de Consultas
- Quantidade de pedidos feitos por cada cliente.
- Identificação de vendedores que também atuam como fornecedores.
- Relação detalhada entre produtos, fornecedores e estoques.
- Listagem de nomes de fornecedores e produtos fornecidos.

## Como Utilizar
1. Clone o repositório:
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

