module Employee
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com/posts'
  format :json
  headers 'Content-Type': 'application/json'
end
