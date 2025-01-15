# Sistema de Controle de Ordens de Serviço para Oficina Mecânica

## Descrição do Projeto
Este projeto tem como objetivo desenvolver um esquema conceitual para um sistema de controle e gerenciamento de ordens de serviço (OS) em uma oficina mecânica. O sistema foi projetado para gerenciar clientes, seus veículos, equipes de mecânicos, serviços realizados e peças utilizadas nas ordens de serviço. O modelo conceitual foi criado a partir de uma narrativa fornecida e pode ser adaptado de acordo com requisitos adicionais identificados durante o processo de implementação.

## Contexto do Sistema
- **Clientes** levam seus **veículos** à oficina para consertos ou revisões periódicas.
- Cada **veículo** é designado a uma **equipe de mecânicos**, que identifica os **serviços** necessários e preenche uma **ordem de serviço (OS)**.
- A partir da OS, calcula-se o valor total, considerando:
  - **Tabela de referência de mão-de-obra** para serviços realizados.
  - Valor das **peças** utilizadas.
- A execução dos serviços é autorizada pelo cliente, avaliada e executada pela mesma equipe.

## Esquema Conceitual
### Entidades e Atributos
1. **Cliente**
   - **Código** (PK)
   - Nome
   - Endereço
   - Telefone

2. **Veículo**
   - **Código** (PK)
   - Placa
   - Modelo
   - Marca
   - Ano
   - **Cliente** (FK)

3. **Ordem de Serviço (OS)**
   - **Número** (PK)
   - Data de Emissão
   - Valor
   - Status
   - Data de Conclusão
   - **Veículo** (FK)
   - **Cliente** (FK)
   - **Equipe** (FK)

4. **Equipe**
   - **Código** (PK)
   - Nome

5. **Mecânico**
   - **Código** (PK)
   - Nome
   - Endereço
   - Especialidade
   - **Equipe** (FK)

6. **Serviço**
   - **Código** (PK)
   - Descrição
   - Valor Mão-de-Obra

7. **Peça**
   - **Código** (PK)
   - Descrição
   - Valor

8. **Serviços na OS**
   - **Número da OS** (FK)
   - **Código do Serviço** (FK)
   - Quantidade
   - Valor Total

9. **Peças na OS**
   - **Número da OS** (FK)
   - **Código da Peça** (FK)
   - Quantidade
   - Valor Total

### Relacionamentos
- Um **Cliente** pode ter múltiplos **Veículos**.
- Cada **Veículo** pode estar associado a múltiplas **Ordens de Serviço (OS)**.
- Uma **OS** é atribuída a uma **Equipe** e inclui múltiplos **Serviços** e **Peças**.
- Uma **Equipe** pode ter vários **Mecânicos**.
- Um **Serviço** pode ser incluído em várias **OS**.
- Uma **Peça** pode ser utilizada em diversas **OS**.

## Estrutura do Repositório
O repositório inclui os seguintes arquivos:
- **README.md**: Descrição do projeto e modelo conceitual.
- **Modelo Conceitual**: Um diagrama visual representando as entidades e seus relacionamentos (adicionado em formato de imagem ou arquivo editável).
- **Documentação**: Qualquer observação ou ajuste baseado em suposições tomadas.

## Observações
Caso encontre alguma ambiguidade ou necessidade de ajuste, as decisões tomadas serão documentadas no repositório para futura avaliação e discussão.

## Como Contribuir
1. Clone o repositório.
2. Realize suas alterações no modelo ou na documentação.
3. Envie um pull request com as mudanças propostas.

---
Este projeto faz parte de um desafio de aprendizado e contribuição para um portfólio profissional.
