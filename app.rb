require('sinatra')
require('sinatra/reloader')
require('./lib/customers')
require('./lib/animal')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

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

get("/animals/:id") do
  @animal = Animal.find(params.fetch("id").to_i())
  erb(:animalinfo)
end

post("/addanimal") do
  animal_name = params.fetch("animal_name")
  gender = params.fetch("gender")
  animal_type = params.fetch("animal_type")
  animal_breed = params.fetch("animal_breed")
  date = params.fetch("date")
  animal = Animal.new({:animal_name => animal_name, :gender => gender, :animal_breed => animal_breed, :date => date, :animal_type => animal_type, :id => nil})
  animal.save()
  @animalname = animal.animal_name
  @animalid = animal.id
  erb(:addanimal)
end
