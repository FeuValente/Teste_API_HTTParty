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

Dado('que o usuario cadastre um novo funcionario') do
    @post_url = 'https://jsonplaceholder.typicode.com/posts'
  end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
      "userId":30,
      "id": 30,
      "title": "EU gosto de comer lasanha com batata e arroz",
      "completed": false
    }.to_json)

    puts @create_employee
  end
  
  Entao('esse funcionario sera cadastrado') do
    expect(@create_employee.code).to eql 201 #aqui verifica se o código da requisição
    puts @create_employee.code   #aqui exibi o c´doigo no terminal
    expect(@create_employee.message).to eql 'Created'
    puts @create_employee.msg
    #expect(@create_employee['title']).to eql 'não gosto de comer lasanha'  #simulando erro de retorno
  end