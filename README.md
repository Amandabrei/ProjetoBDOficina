<h1> Projeto Oficina DIO </h1>

<h2> Cenário: Oficina Mecânica "AutoTech" </h2>

A oficina presta serviços de manutenção e reparos em veículos. 

Clientes podem agendar serviços, que são realizados por mecânicos especializados. 

A oficina também vende peças e pode comprar de fornecedores. 

O banco de dados deve armazenar informações sobre clientes, veículos, serviços, funcionários, peças e fornecedores.


<h2> Entidades e Relacionamentos:</h2>
<h4>
Cliente (clients) → pode ter vários veículos.

Veículo (vehicles) → pertence a um único cliente.

Serviço (services) → é realizado em um veículo e pode usar peças.

Funcionário (employees) → mecânicos que executam serviços.

Fornecedor (suppliers) → vende peças para a oficina.

Peças (parts) → usadas nos serviços e compradas dos fornecedores.

Ordem de Serviço (work_orders) → relaciona serviço, veículo, funcionário e peças.
</h4>
