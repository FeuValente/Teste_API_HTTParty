# language: pt

Funcionalidade: PEsquisar Funcionarios
    Para averiguar informações
    O usuário do sistema
    Deseja poder consultar informações dos funcionários

    Cenario: Buscar informações de funcionario
        Dado que o usuario consulte infomacoes de funcionario
        Quando ele realizar a pesquisa
        Entao Uma lista de funcionarios deve retornar

    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informacoes do funcionario
        Entao esse funcionario sera cadastrado

    @cenario_tres
    Cenario: Editar funcionario
        Dado que o usuario edite um funcionario
        Quando ele edita as informacoes
        Entao as informacoes serao editadas
