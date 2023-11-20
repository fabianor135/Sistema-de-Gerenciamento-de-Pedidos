# Sistema-de-Gerenciamento-de-Pedidos

Etapa 1: Criação de Tabelas e Inserção de Dados

Crie as tabelas "Clientes" e "Pedidos" com campos apropriados. 
Insira dados de exemplo nas tabelas para simular clientes e pedidos. 
Certifique-se de incluir uma chave primária em cada tabela.

Certifique-se de incluir uma chave primária em cada tabela:
![image](https://github.com/fabianor135/Sistema-de-Gerenciamento-de-Pedidos/assets/84815028/848507c9-05d8-4c6d-9254-b5cd9fe57454)
![image](https://github.com/fabianor135/Sistema-de-Gerenciamento-de-Pedidos/assets/84815028/34a82b49-3ea5-40aa-983f-7f44b43a72c9)

Etapa 2: Criação de Stored Procedure

Crie uma stored procedure chamada "InserirPedido" que permite inserir um novo pedido na tabela "Pedidos" com as informações apropriadas.
A stored procedure deve receber parâmetros como o ID do cliente e os detalhes do pedido.
Ao término teste o funcionamento da stored procedure criada inserindo um pedido.

![image](https://github.com/fabianor135/Sistema-de-Gerenciamento-de-Pedidos/assets/84815028/14c5ae4d-bec0-4184-bd47-5d633df7c0b2)

Etapa 3: Trigger

Crie uma trigger que seja acionada APÓS a inserção de um novo pedido na tabela "Pedidos".
A trigger deve calcular o valor total dos pedidos para o cliente correspondente e atualizar um campo "TotalPedidos" na tabela "Clientes" com o valor total. 
Teste a Trigger inserindo um novo pedido na tabela "Pedidos“.

![image](https://github.com/fabianor135/Sistema-de-Gerenciamento-de-Pedidos/assets/84815028/a84b6a7f-3ea2-4428-99c1-76931f2951ca)



