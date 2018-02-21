require ('rspec')
require ('pg')
require ('animal')
require ('customers')

DB = PG.connect({:dbname => 'animal_shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM customers *;")
    DB.exec("DELETE FROM animal *;")
  end
end
