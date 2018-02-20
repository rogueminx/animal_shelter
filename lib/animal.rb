class Animal
  @@animal_list = []

  def initialize(attributes)
    @animal_name = attributes.fetch(:animal_name)
    @gender = attributes.fetch(:gender)
    @animal_breed = attributes.fetch(:animal_breed)
    @date = attributes.fetch(:date)
    @animal_type = attributes.fetch(:animal_type)
    @customer_id = attributes.fetch(:customer_id)
  end

  def ==(another_pet)
    self.animal_name().==(another_pet.animal_name()).&(self.customer_id().==(another_pet.customer_id()))
  end

  def animal_name
    @name
  end

  def customer_id
    @customer_id
  end

  def self.all()
    returned_animals = DB.exec("SELECT * FROM animal;")
    animals = []
    returned_animals.each() do |item|
      animal_name = item.fetch("animal_name")
      gender = gender.fetch("gender")
      animal_breed = animal_breed.fetch("animal_breed")
      date = date.fetch("date")
      animal_type = animal_type.fetch("animal_type")
      customer_id = item.fetch("customer_id").to_i() # The information comes out of the database as a string.
      animals.push(Animal.new({:animal_name => animal_name, :gender => gender, :animal_breed => animal_breed, :date => date, :animal_type => animal_type, :customer_id => customer_id}))
    end
    animals
  end

  def populate_list
    if (self.term)
      @@list.push(self)
    end
  end

  def self.list
    @@list
  end

  def self.clear
    @@list.clear
  end
end
