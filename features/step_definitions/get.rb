Dado('que o usuario consulte infomacoes de funcionario') do
  @get_url = 'https://jsonplaceholder.typicode.com/posts'
end

  Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
  end

  Entao('Uma lista de funcionarios deve retornar') do
   expect(@list_employee.code).to eql 200
   expect(@list_employee.message).to eql 'OK'
  end