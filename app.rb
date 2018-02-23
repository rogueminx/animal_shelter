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
  @animals = Animal.sort_az()
  erb(:athroughz)
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
  @animals = Animal.sort_arrival()
  erb(:allanimals)
end

get('/employees/customersbybreed') do
  @customers = Customers.all()
  erb(:customersbybreed)
end

get('/employees/adoption') do
  erb(:adoption)
end

get("/animals/:id") do
  @animal = Animal.find(params.fetch("id").to_i())
  erb(:animalinfo)
end

get("/customers/:id") do
  @customer = Customers.find(params.fetch("id").to_i())
  erb(:customerinfo)
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

post("/addcustomer") do
  customer_name = params.fetch("customer_name")
  phone = params.fetch("phone")
  animal_type_preference = params.fetch("animal_type_preference")
  breed_preference = params.fetch("breed_preference")
  customer = Customers.new({:customer_name => customer_name, :phone => phone, :animal_type_preference => animal_type_preference, :breed_preference => breed_preference, :id => nil})
  customer.save()
  @customername = customer.customer_name
  @customerid = customer.id
  erb(:addcustomer)
end

delete("/animals/:id") do
  @animal = Animal.find(params.fetch("id").to_i())
  @animal.delete()
  @animals = Animal.all() #necessary to reset for new page after delete?
  erb(:allanimals)
end
