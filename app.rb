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
