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

Dado('que o usuario edite um funcionario') do
    @get_employee = HTTParty.get('https://jsonplaceholder.typicode.com/posts', :headers => {'Content-Type': 'application/json'})
    puts @get_employee[0]['id']
    @put_url = 'https://jsonplaceholder.typicode.com/posts/' + @get_employee[0]['id'].to_s
  end
  
  Quando('ele edita as informacoes') do
    @edit_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {
        "userId": 1,
        "id": 3,
        "title": "comi bananada hoje de manha",
        "body": "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
    }.to_json)

    puts @edit_employee
  end
  
  Entao('as informacoes serao editadas') do
    expect(@edit_employee.code).to eql 200
    expect(@edit_employee.message).to eql 'OK'
    puts @edit_employee.code
    puts @edit_employee.msg
  end

Dado('que o usuario delete um funcionario') do
  @get_employee = HTTParty.get('https://jsonplaceholder.typicode.com/posts', :headers => {'Content-Type': 'application/json'})
  puts @get_employee[0]['id']
  @delete_url = 'https://jsonplaceholder.typicode.com/posts/' + @get_employee[0]['id'].to_s
  end
  
  Quando('ele delete as informacoes') do
    @delete_employee = HTTParty.delete('https://jsonplaceholder.typicode.com/posts/1')
    puts @delete_employee
  end
  
  Entao('as informacoes sao deletadas') do
    expect(@delete_employee.code).to eql 200
    expect(@delete_employee.message).to eql 'OK'
  end