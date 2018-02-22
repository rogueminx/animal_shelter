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

get('/customers/athroughz') do
  erb(:customer/athroughz)
end

get('/customers/byanimaltype') do
  erb(:byanimaltype)
end

get('/customers/animalsbybreed') do
  erb(:animalsbybreed)
end

get('/employees') do
  erb(:employee)
end

get('/employees/addanimal') do
  erb(:addanimal)
end

get('/employees/addcustomer') do
  erb(:addcustomer)
end

get('/employees/allanimals') do
  erb(:allanimals)
end

get('/employees/customersbybreed') do
  erb(:customersbybreed)
end

get('/employees/adoption') do
  erb(:adoption)
end
