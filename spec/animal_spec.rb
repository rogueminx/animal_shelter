require("spec_helper")
require("rspec")
require('pg')
require('pry')
require('animal')

describe(Animal) do
  describe('#==') do
    it('is the same animal if names and ids are the same') do
      one = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :id => nil})
      two = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :id => nil})
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
      first_animal = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :id => nil})
      first_animal.save
      expect(Animal.all()).to(eq([first_animal]))
    end
  end # save

  describe("#id") do
    it("sets its ID when you save it") do
      animal_one = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :id => nil})
      animal_one.save()
      expect(animal_one.id()).to(be_an_instance_of(Fixnum)) # don't know what specific ID the database will assign it, so all we can do is check to make sure the ID is an Integer/Fixnum(at home). Works together with the save method.
    end
  end

  describe('#sort_type') do
    it('returns a list of animals according to animal type (dog/cat/etc)') do
      first_animal = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :id => nil})
      first_animal.save
      second_animal = Animal.new({:animal_name => 'Rock', :gender => 'male', :animal_breed => 'husky', :date => '2018-01-12', :animal_type => 'dog', :id => nil})
      second_animal.save
      third_animal = Animal.new({:animal_name => 'Puffers', :gender => 'male', :animal_breed => 'tabby', :date => '2018-01-12', :animal_type => 'cat', :id => nil})
      third_animal.save
      expect(third_animal.sort_type('cat')).to(eq([third_animal]))
    end
  end

  describe('#sort_breed') do
    it('returns a list of animal ids for a breed search term') do
      first_animal = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :id => nil})
      first_animal.save
      second_animal = Animal.new({:animal_name => 'Rock', :gender => 'male', :animal_breed => 'husky', :date => '2018-01-12', :animal_type => 'dog', :id => nil})
      second_animal.save
      expect(second_animal.sort_breed('husky')).to(eq([second_animal]))
    end
  end #sort_breed

    describe('#sort_az') do
      it('returns a list of animals by name A-Z ') do
        first_animal = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-05-01', :animal_type => 'dog', :id => nil})
        first_animal.save
        second_animal = Animal.new({:animal_name => 'Rock', :gender => 'male', :animal_breed => 'husky', :date => '2018-01-12', :animal_type => 'dog', :id => nil})
        second_animal.save
        third_animal = Animal.new({:animal_name => 'Banana', :gender => 'female', :animal_breed => 'Paint', :date => '2018-02-14', :animal_type => 'horse', :id => nil})
        third_animal.save
        expect(third_animal.sort_az()).to(eq([third_animal,second_animal,first_animal]))
      end
    end #sort_breed

    describe('#sort_arrival') do
      it('returns a list of animals in the order that they arrive oldest arrival -> new') do
        first_animal = Animal.new({:animal_name => 'Scrappy', :gender => 'female', :animal_breed => 'mixed', :date => '2018-02-14', :animal_type => 'dog', :id => nil})
        first_animal.save
        second_animal = Animal.new({:animal_name => 'Rock', :gender => 'male', :animal_breed => 'husky', :date => '2017-12-12', :animal_type => 'dog', :id => nil})
        second_animal.save
        third_animal = Animal.new({:animal_name => 'Banana', :gender => 'female', :animal_breed => 'Paint', :date => '2018-01-14', :animal_type => 'horse', :id => nil})
        third_animal.save
        expect(third_animal.sort_arrival()).to(eq([second_animal, third_animal, first_animal]))
      end
    end #sort_arrival

end #Animal
