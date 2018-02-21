require("spec_helper")
require("rspec")
require('pg')
require('pry')
require('animal')

describe(Animal) do
  describe('#==') do
    it('is the same animal if names are the same') do
      one = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :customer_id => 1})
      two = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :customer_id => 1})
      expect(one).to(eq(two))
    end
  end # ==

  describe('.all') do
    it('empty at first, will populate later.') do
      expect(Animal.all()).to(eq([]))
    end
  end #all

  describe('#save') do
    it('adds animal to an array of animals') do
      first_animal = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :customer_id => 1})
      first_animal.save
      expect(Animal.all()).to(eq([first_animal]))
    end
  end # save

  describe('.sort_breed') do
    it('sorts animals by breed') do
      first_animal = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :customer_id => 1})
      first_animal.save
      second_animal = Animal.new({:animal_name => 'Rock', :gender => 'male', :animal_breed => 'husky', :date => '2018-01-12', :animal_type => 'dog', :customer_id => 1})
      second_animal.save
      expect(Animal.sort_breed('husky')).to(eq([["Rock", "male", "husky"]]))
    end
  end # save


end #Animal
