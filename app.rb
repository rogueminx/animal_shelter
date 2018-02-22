require('sinatra')
require('sinatra/reloader')
require('./lib/customers')
require('./lib/animal')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "animal_shelter"})

get('/') do
  erb(:index)
end

get('/customers') do
  @animals = Animal.all()
  erb(:customer)
end

get('/employees') do
  erb(:employee)
end
