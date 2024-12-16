USE salao_senac;

INSERT INTO usuario (email, senha, tipo_usuario) VALUES
('ana.silva@example.com', 'senha123', 'Cliente'),
('bruno.souza@example.com', 'senha123', 'Cliente'),
('carla.oliveira@example.com', 'senha123', 'Cliente'),
('daniel.costa@example.com', 'senha123', 'Cliente'),
('eduarda.lima@example.com', 'senha123', 'Cliente'),
('felipe.mendes@example.com', 'senha123', 'Cliente'),
('gabriela.rocha@example.com', 'senha123', 'Cliente'),
('henrique.alves@example.com', 'senha123', 'Cliente'),
('isabela.ferreira@example.com', 'senha123', 'Cliente'),
('joao.santos@example.com', 'senha123', 'Cliente'),
('mariana.ribeiro@example.com', 'senha123', 'Funcionário'),
('ricardo.pereira@example.com', 'senha123', 'Funcionário'),
('larissa.silva@example.com', 'senha123', 'Funcionário'),
('tiago.fernandes@example.com', 'senha123', 'Funcionário'),
('paula.souza@example.com', 'senha123', 'Funcionário'),
('fernando.lima@example.com', 'senha123', 'Funcionário'),
('beatriz.carvalho@example.com', 'senha123', 'Funcionário'),
('carlos.oliveira@example.com', 'senha123', 'Funcionário'),
('juliana.costa@example.com', 'senha123', 'Funcionário'),
('andre.martins@example.com', 'senha123', 'Funcionário');

INSERT INTO cliente (cpf_cliente, nome, telefone, usuario_cliente) VALUES
('123.456.789-01', 'Ana Silva', '11987654321', 1),
('234.567.890-12', 'Bruno Souza', '11987654322', 2),
('345.678.901-23', 'Carla Oliveira', '11987654323', 3),
('456.789.012-34', 'Daniel Costa', '11987654324', 4),
('567.890.123-45', 'Eduarda Lima', '11987654325', 5),
('678.901.234-56', 'Felipe Mendes', '11987654326', 6),
('789.012.345-67', 'Gabriela Rocha', '11987654327', 7),
('890.123.456-78', 'Henrique Alves', '11987654328', 8),
('901.234.567-89', 'Isabela Ferreira', '11987654329', 9),
('012.345.678-90', 'João Santos', '11987654330', 10);

INSERT INTO cargo (nome) VALUES
('Cabeleireiro'),
('Manicure'),
('Maquiador'),
('Esteticista'),
('Recepcionista'),
('Depilador'),
('Colorista'),
('Massoterapeuta'),
('Designer de Sobrancelhas'),
('Gerente');

INSERT INTO funcionario (matricula, cpf_func, usuario_func, nome, telefone, salario, cargo_id) VALUES
('FUNC2024001', '123.987.654-01', 11, 'Mariana Ribeiro', '11987654331', 1500.00, 1),
('FUNC2024002', '234.876.543-12', 12, 'Ricardo Pereira', '11987654332', 4200.00, 2),
('FUNC2024003', '345.765.432-23', 13, 'Larissa Silva', '11987654333', 3000.00, 3),
('FUNC2024004', '456.654.321-34', 14, 'Tiago Fernandes', '11987654334', 3500.00, 4),
('FUNC2024005', '567.543.210-45', 15, 'Paula Souza', '11987654335', 2000.00, 5),
('FUNC2024006', '678.432.109-56', 16, 'Fernando Lima', '11987654336', 3200.00, 6),
('FUNC2024007', '789.321.098-67', 17, 'Beatriz Carvalho', '11987654337', 2100.00, 7),
('FUNC2024008', '890.210.987-78', 18, 'Carlos Oliveira', '11987654338', 3800.00, 8),
('FUNC2024009', '901.109.876-89', 19, 'Juliana Costa', '11987654339', 1700.00, 9),
('FUNC2024010', '012.098.765-90', 20, 'André Martins', '11987654340', 2000.00, 10);

INSERT INTO agendamento (data_agendada, hora, cliente_cpf, matricula_func) VALUES
('2024-06-01', '09:00:00', '123.456.789-01', 'FUNC2024001'),
('2024-06-01', '10:30:00', '234.567.890-12', 'FUNC2024002'),
('2024-06-02', '11:00:00', '345.678.901-23', 'FUNC2024003'),
('2024-06-02', '14:00:00', '456.789.012-34', 'FUNC2024004'),
('2024-06-03', '08:30:00', '567.890.123-45', 'FUNC2024005'),
('2024-06-03', '15:00:00', '678.901.234-56', 'FUNC2024006'),
('2024-06-04', '16:30:00', '789.012.345-67', 'FUNC2024007'),
('2024-06-04', '17:00:00', '890.123.456-78', 'FUNC2024008'),
('2024-06-05', '09:00:00', '901.234.567-89', 'FUNC2024009'),
('2024-06-05', '13:30:00', '012.345.678-90', 'FUNC2024010');

INSERT INTO categorias (nome) VALUES
('Corte de Cabelo'),
('Coloração'),
('Manicure e Pedicure'),
('Hidratação Capilar'),
('Penteados'),
('Maquiagem'),
('Depilação'),
('Design de Sobrancelhas'),
('Escova e Finalização'),
('Tratamento Facial');

INSERT INTO servicos (nome, descricao, preco_base, duracao_mins, categoria_id) VALUES
('Corte Masculino', 'Corte de cabelo estilo clássico ou moderno', 50.00, 30, 1),
('Corte Feminino', 'Corte de cabelo com finalização personalizada', 70.00, 45, 1),
('Coloração Completa', 'Aplicação de tinta para mudança de cor total', 150.00, 120, 2),
('Luzes/Reflexos', 'Mechas claras para iluminar o visual', 200.00, 180, 2),
('Manicure', 'Cuidados e esmaltação das unhas das mãos', 30.00, 30, 3),
('Pedicure', 'Cuidados e esmaltação das unhas dos pés', 40.00, 45, 3),
('Hidratação Profunda', 'Tratamento capilar com produtos nutritivos', 80.00, 60, 4),
('Reconstrução Capilar', 'Tratamento para reparar cabelos danificados', 120.00, 90, 4),
('Penteado para Festas', 'Penteados elaborados para eventos especiais', 150.00, 90, 5),
('Maquiagem Completa', 'Maquiagem profissional para ocasiões especiais', 100.00, 60, 6),
('Depilação Corporal', 'Depilação com cera para várias áreas do corpo', 80.00, 60, 7),
('Depilação Facial', 'Depilação com cera para o rosto', 40.00, 30, 7),
('Design de Sobrancelhas', 'Definição e ajuste do formato das sobrancelhas', 50.00, 30, 8),
('Escova Progressiva', 'Alisamento temporário e hidratação dos fios', 250.00, 180, 9),
('Limpeza de Pele', 'Tratamento facial para remover impurezas', 120.00, 90, 10);

INSERT INTO atendimento (agendamento_id, matricula_func, duracao_mins) VALUES
(1, 'FUNC2024001', 30),
(2, 'FUNC2024002', 45),
(3, 'FUNC2024003', 120),
(4, 'FUNC2024004', 180),
(5, 'FUNC2024005', 30),
(6, 'FUNC2024006', 45),
(7, 'FUNC2024007', 60),
(8, 'FUNC2024008', 90),
(9, 'FUNC2024009', 90),
(10, 'FUNC2024010', 60);


INSERT INTO fornecedor (nome, email, telefone) VALUES
('Beleza Suprema', 'contato@belezasuprema.com', '81987654301'),
('Estética Plus', 'vendas@esteticaplus.com', '11987654302'),
('Hair & Care', 'suporte@haircare.com', '11987654303'),
('Cosméticos Naturais', 'info@cosmeticosnaturais.com', '11987654304'),
('Estilo e Elegância', 'contato@estiloelegancia.com', '11987654305'),
('Produtos Glamour', 'vendas@produtosglamour.com', '11987654306'),
('Beleza & Saúde', 'comercial@belezasaude.com', '11987654307'),
('Equipamentos Pro', 'equipamentos@probeleza.com', '11987654308'),
('Suprema Estética', 'suporte@supremaestetica.com', '11987654309'),
('Cosméticos Vida', 'vendas@cosmeticosvida.com', '11987654310');

INSERT INTO equipamento (nome, fornecedor_id, manutencao_recente) VALUES
('Secador de Cabelo Pro', 1, '2024-01-15'),
('Prancha Alisadora', 2, '2024-02-10'),
('Máquina de Corte', 3, '2024-03-05'),
('Poltrona Hidráulica', 4, '2024-01-20'),
('Carrinho Auxiliar', 5, '2024-02-25'),
('Lavatório para Cabelos', 6, '2024-03-01'),
('Esterilizador UV', 7, '2024-01-30'),
('Balança de Precisão', 8, '2024-02-15'),
('Lupa com Suporte', 9, '2024-03-10'),
('Aspirador de Pó Portátil', 10, '2024-01-05');

INSERT INTO produtos (nome, preco, estoque, fornecedor_id) VALUES
('Shampoo Hidratante', 25.50, 100, 1),
('Condicionador Revitalizante', 30.00, 80, 2),
('Máscara Capilar Nutritiva', 45.00, 60, 3),
('Creme de Pentear', 18.00, 150, 4),
('Gel Modelador', 20.50, 120, 5),
('Óleo de Argan', 50.00, 75, 6),
('Escova de Cabelos', 35.00, 200, 7),
('Esmalte Profissional', 10.00, 500, 8),
('Desinfetante para Equipamentos', 15.00, 40, 9),
('Lixa de Unha Profissional', 5.00, 300, 10),
('Loção Hidratante Facial', 28.00, 90, 1),
('Kit de Depilação', 60.00, 50, 2),
('Protetor Térmico', 40.00, 130, 3),
('Creme para Pés', 22.00, 110, 4),
('Hidratante Corporal', 35.00, 200, 5);

INSERT INTO produto_atendimento (atendimento_id, produto_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 1),
(9, 2),
(9, 3),
(10, 4),
(10, 5);

INSERT INTO venda_produto (produto_id, desconto, data_venda, qtde, cliente_cpf) VALUES
(1, 10.00, '2024-06-01', 2, '123.456.789-01'),
(2, 15.00, '2024-06-02', 1, '234.567.890-12'),
(3, 20.00, '2024-06-03', 3, '345.678.901-23'),
(4, 5.00, '2024-06-04', 5, '456.789.012-34'),
(5, 12.00, '2024-06-05', 2, '567.890.123-45'),
(6, 18.00, '2024-06-06', 1, '678.901.234-56'),
(7, 0.00, '2024-06-07', 4, '789.012.345-67'),
(8, 8.00, '2024-06-08', 3, '890.123.456-78'),
(9, 25.00, '2024-06-09', 2, '901.234.567-89'),
(10, 0.00, '2024-06-10', 6, '012.345.678-90'),
(11, 10.00, '2024-06-11', 1, '123.456.789-01'),
(12, 5.00, '2024-06-12', 2, '234.567.890-12'),
(13, 18.00, '2024-06-13', 1, '345.678.901-23'),
(14, 20.00, '2024-06-14', 2, '456.789.012-34'),
(15, 10.00, '2024-06-15', 3, '567.890.123-45');

INSERT INTO venda_servico (atendimento_id, servico_id, preco_final, duracao_mins) VALUES
(1, 1, 50.00, 30),
(2, 2, 70.00, 45),
(3, 3, 150.00, 120),
(4, 4, 200.00, 180),
(5, 5, 30.00, 30),
(6, 6, 40.00, 45),
(7, 7, 80.00, 60),
(8, 8, 90.00, 90),
(9, 9, 150.00, 90),
(10, 10, 100.00, 60),
(1, 11, 60.00, 45),
(2, 12, 40.00, 30),
(3, 13, 80.00, 90),
(4, 14, 120.00, 120),
(5, 15, 100.00, 90);

INSERT INTO feedback (cliente_cpf, atendimento_id, avaliacao, comentario, selo_cortesia, selo_limpeza, selo_satisfacao, selo_orientacao, matricula_func) VALUES
('123.456.789-01', 1, 5, 'Atendimento excelente! Muito atenciosos e profissionais.', 'sim', 'sim', 'sim', 'sim', 'FUNC2024001'),
('234.567.890-12', 2, 4, 'O serviço foi bom, mas poderia ter sido um pouco mais rápido.', 'sim', 'não', 'sim', 'sim', 'FUNC2024002'),
('345.678.901-23', 3, 3, 'O atendimento foi ok, mas a duração foi maior do que eu esperava.', 'não', 'sim', 'não', 'sim', 'FUNC2024003'),
('456.789.012-34', 4, 2, 'O serviço não atendeu às minhas expectativas, não voltarei.', 'não', 'não', 'não', 'não', 'FUNC2024004'),
('567.890.123-45', 5, 5, 'Adorei o atendimento, muito bem feito e explicativo.', 'sim', 'sim', 'sim', 'sim', 'FUNC2024005'),
('678.901.234-56', 6, 4, 'O serviço foi bom, mas poderia melhorar na parte da explicação.', 'sim', 'sim', 'sim', 'não', 'FUNC2024006'),
('789.012.345-67', 7, 5, 'Muito bom! Fui bem orientado e o ambiente estava super limpo.', 'sim', 'sim', 'sim', 'sim', 'FUNC2024007'),
('890.123.456-78', 8, 3, 'O atendimento foi bom, mas o local não estava tão limpo quanto eu esperava.', 'não', 'não', 'não', 'não', 'FUNC2024008'),
('901.234.567-89', 9, 4, 'Serviço bom, mas o preço poderia ser um pouco mais acessível.', 'sim', 'sim', 'sim', 'sim', 'FUNC2024009'),
('012.345.678-90', 10, 5, 'Excelente serviço! Recomendo a todos!', 'sim', 'sim', 'sim', 'sim', 'FUNC2024010');

INSERT INTO horarios (hora_inicio, hora_fim) VALUES
('08:00:00', '10:00:00'),
('09:30:00', '11:30:00'),
('11:00:00', '13:00:00'),
('12:30:00', '14:30:00'),
('13:00:00', '15:00:00'),
('14:30:00', '16:30:00'),
('15:00:00', '17:00:00'),
('16:00:00', '18:00:00'),
('17:00:00', '19:00:00'),
('18:00:00', '20:00:00');

INSERT INTO funcionario_turno (matricula_func, dia_semana, horario_id) VALUES
('FUNC2024001', 'Segunda-feira', 1),
('FUNC2024002', 'Segunda-feira', 2),
('FUNC2024003', 'Terça-feira', 3),
('FUNC2024004', 'Terça-feira', 4),
('FUNC2024005', 'Quarta-feira', 5),
('FUNC2024006', 'Quarta-feira', 6),
('FUNC2024007', 'Quinta-feira', 7),
('FUNC2024008', 'Quinta-feira', 8),
('FUNC2024009', 'Sexta-feira', 9),
('FUNC2024010', 'Sexta-feira', 10),
('FUNC2024001', 'Segunda-feira', 3),
('FUNC2024002', 'Terça-feira', 1),
('FUNC2024003', 'Quarta-feira', 2),
('FUNC2024004', 'Quinta-feira', 5),
('FUNC2024005', 'Sexta-feira', 6);

