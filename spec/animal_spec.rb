require("spec_helper")
require("rspec")
require('pg')
require('animal')

describe(Animal) do
  describe('#==') do
    it('is the same animal if names are the same') do
      one = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :customer_id => 1})
      two = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :customer_id => 1})
      expect(one).to(eq(two))
    end
  end # ==
end #Animal
