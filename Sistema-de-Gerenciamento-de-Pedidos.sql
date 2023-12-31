
/*1)Crie as tabelas "Clientes" e "Pedidos" com campos apropriados. 
Insira dados de exemplo nas tabelas para simular clientes e pedidos.
Certifique-se de incluir uma chave primária em cada tabela*/

CREATE TABLE clientes (
    id_cliente int auto_increment,
    nome varchar(50),
    sobrenome varchar(50),
    endereco varchar(100),
    email varchar(50),
    telefone varchar(20),
    primary key (id_cliente)
);

insert into clientes (nome, sobrenome, endereco, email, telefone)values ('carlos', 'ribeiro', 'avenida d, 567', 'carlos@email.com', '999-888-7777');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('ana', 'martins', 'rua e, 890', 'ana@email.com', '444-555-6666');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('miguel', 'pereira', 'travessa f, 123', 'miguel@email.com', '222-333-4444');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('camila', 'gonçalves', 'avenida g, 456', 'camila@email.com', '777-888-9999');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('lucas', 'rodrigues', 'rua h, 789', 'lucas@email.com', '666-555-4444');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('isabela', 'fernandes', 'rua i, 234', 'isabela@email.com', '333-222-1111');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('fernando', 'santana', 'avenida j, 567', 'fernando@email.com', '888-999-0000');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('julia', 'oliveira', 'travessa k, 890', 'julia@email.com', '111-222-3333');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('gabriel', 'silveira', 'rua l, 123', 'gabriel@email.com', '999-888-7777');
insert into clientes (nome, sobrenome, endereco, email, telefone)values('sophia', 'lima', 'avenida m, 456', 'sophia@email.com', '777-666-5555');

select * from clientes

CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT,
    id_cliente INT,
    Data_Pedido DATE,
    Total_Pedido DECIMAL(10, 2),
    Status_Pedido VARCHAR(20),
    PRIMARY KEY (ID_Pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total_Pedido, Status_Pedido)VALUES (3, '2023-11-03', 100.50, 'Entregue');
INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total_Pedido, Status_Pedido)VALUES (4, '2023-11-04', 25.75, 'Entregue');
INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total_Pedido, Status_Pedido)VALUES (5, '2023-11-05', 60.20, 'Em andamento');
INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total_Pedido, Status_Pedido)VALUES (6, '2023-11-06', 80.00, 'Entregue');
INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total_Pedido, Status_Pedido)VALUES (7, '2023-11-07', 45.30, 'Entregue');
INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total_Pedido, Status_Pedido)VALUES (8, '2023-11-08', 30.75, 'Entregue');
INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total_Pedido, Status_Pedido)VALUES (9, '2023-11-09', 90.60, 'Em andamento');
INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total_Pedido, Status_Pedido)VALUES (10, '2023-11-10', 55.40, 'Entregue');




select * from Pedidos

/*2)Crie uma stored procedure chamada "InserirPedido" que permite inserir um novo pedido na tabela "Pedidos" com as informações apropriadas. 
A stored procedure deve receber parâmetros como o ID do cliente e os detalhes do pedido.
Ao término teste o funcionamento da stored procedure criada inserindo um pedido.*/

delimiter //

CREATE PROCEDURE inserirpedido (
    IN clienteid INT,
    IN data_pedido DATE,
    IN total_pedido DECIMAL(10, 2),
    IN status_pedido VARCHAR(20)
)
BEGIN
    INSERT INTO pedidos (id_cliente, data_pedido, total_pedido, status_pedido)
    VALUES (clienteid, data_pedido, total_pedido, status_pedido);
END//

delimiter ;

/*3)Crie uma trigger que seja acionada APÓS a inserção de um novo pedido na tabela "Pedidos".
  A trigger deve calcular o valor total dos pedidos para o cliente correspondente e atualizar um campo "TotalPedidos" na tabela "Clientes" com o valor total. 
  Teste a Trigger inserindo um novo pedido na tabela "Pedidos“.*/
  
ALTER TABLE clientes
ADD COLUMN TotalPedidos DECIMAL(10, 2);

DELIMITER $$

CREATE TRIGGER atualizarTotalPedidos AFTER INSERT ON Pedidos FOR EACH ROW
BEGIN
    -- Atualize o total de pedidos para o cliente correspondente
    UPDATE clientes
    SET TotalPedidos = (SELECT SUM(Total_Pedido) FROM Pedidos WHERE id_cliente = NEW.id_cliente)
    WHERE id_cliente = NEW.id_cliente;
END $$

DELIMITER ;



INSERT INTO Pedidos (id_cliente, Data_Pedido, Total_Pedido, Status_Pedido) VALUES (1, '2023-11-11', 2, 'Entregue');

/*Crie uma view chamada "PedidosClientes" que combina informações das tabelas
"Clientes" e "Pedidos" usando JOIN para mostrar os detalhes dos pedidos e os nomes dos clientes.*/

CREATE VIEW PedidosClientes AS
SELECT
    Pedidos.ID_Pedido,
    Clientes.id_cliente,
    Clientes.nome,
    Clientes.sobrenome,
    Clientes.endereco,
    Clientes.email,
    Clientes.telefone,
    Pedidos.Data_Pedido,
    Pedidos.Total_Pedido,
    Pedidos.Status_Pedido
FROM
    Pedidos
JOIN
    Clientes ON Pedidos.id_cliente = Clientes.id_cliente;

SELECT * FROM PedidosClientes;

SELECT
    pc.id_cliente,
    pc.nome,
    pc.sobrenome,
    pc.endereco,
    pc.email,
    pc.telefone,
    pc.ID_Pedido,
    pc.Data_Pedido,
    pc.Total_Pedido,
    pc.Status_Pedido
FROM
    PedidosClientes pc;
















