class Animal

  attr_reader(:animal_name, :date, :gender, :animal_breed, :animal_type, :id)
  attr_accessor(:customer_id)

  def initialize(attributes)
    @animal_name = attributes.fetch(:animal_name)
    @gender = attributes.fetch(:gender)
    @animal_breed = attributes.fetch(:animal_breed)
    @date = attributes.fetch(:date)
    @animal_type = attributes.fetch(:animal_type)
    @id = attributes.fetch(:id)
  end #initialize

  def ==(another_pet)
    self.animal_name().==(another_pet.animal_name()).&(self.id().==(another_pet.id())).&(self.gender().==(another_pet.gender())).&(self.animal_breed().==(another_pet.animal_breed())).&(self.date().==(another_pet.date())).&(self.animal_type().==(another_pet.animal_type()))
  end #==

  def save
    result = DB.exec("INSERT INTO animal (animal_name, gender, animal_breed, date, animal_type) VALUES ('#{@animal_name}', '#{@gender}', '#{@animal_breed}', '#{@date}', '#{@animal_type}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end #save
  #We can insert a record into the database and have the ID of that new entry be returned to us by adding RETURNING id to the end of our INSERT command.
  #The pg gem always returns information in an array (technically it's not an array but it behaves more or less like one). When we save a list and want to get its ID, we have to use the first() method to take it out of the array. Then we can use the fetch method to select the ID.

  def self.find

  end

  def self.all()
    returned_animals = DB.exec("SELECT * FROM animal;")
    animals = []
    returned_animals.each() do |item|
      animal_name = item.fetch("animal_name")
      gender = item.fetch("gender")
      animal_breed = item.fetch("animal_breed")
      date = item.fetch("date")
      animal_type = item.fetch("animal_type")
      id = item.fetch("id").to_i()
      animals.push(Animal.new({:animal_name => animal_name, :gender => gender, :animal_breed => animal_breed, :date => date, :animal_type => animal_type, :id => id}))
    end
    animals
  end #all

  def sort_type(type)
    @type = type
    returned_animals = []
    all_animals = DB.exec("SELECT * FROM animal WHERE animal_type = '#{@type}';")
    all_animals.each() do |item|
      animal_name = item.fetch("animal_name")
      gender = item.fetch("gender")
      animal_breed = item.fetch("animal_breed")
      date = item.fetch("date")
      animal_type = item.fetch("animal_type")
      id = item.fetch("id").to_i()
      returned_animals.push(Animal.new({:animal_name => animal_name, :gender => gender, :animal_breed => animal_breed, :date => date, :animal_type => animal_type, :id => id}))
    end
    returned_animals
  end #sort_type


  def sort_breed(breed)
    @breed = breed
    returned_animals = []
    all_animals = DB.exec("SELECT * FROM animal WHERE animal_breed = '#{@breed}';")
    all_animals.each() do |item|
      animal_name = item.fetch("animal_name")
      gender = item.fetch("gender")
      animal_breed = item.fetch("animal_breed")
      date = item.fetch("date")
      animal_type = item.fetch("animal_type")
      id = item.fetch("id").to_i()
      returned_animals.push(Animal.new({:animal_name => animal_name, :gender => gender, :animal_breed => animal_breed, :date => date, :animal_type => animal_type, :id => id}))
    end
    returned_animals
  end # sort_breed

  def sort_az()
    returned_animals = []
    all_animals = DB.exec("SELECT * FROM animal ORDER BY animal_name ASC;")
    all_animals.each() do |item|
      animal_name = item.fetch("animal_name")
      gender = item.fetch("gender")
      animal_breed = item.fetch("animal_breed")
      date = item.fetch("date")
      animal_type = item.fetch("animal_type")
      id = item.fetch("id").to_i()
      returned_animals.push(Animal.new({:animal_name => animal_name, :gender => gender, :animal_breed => animal_breed, :date => date, :animal_type => animal_type, :id => id}))
    end
    returned_animals
  end # sort_az

  def sort_arrival()
    returned_animals = []
    all_animals = DB.exec("SELECT * FROM animal ORDER BY date;")
    all_animals.each() do |item|
      animal_name = item.fetch("animal_name")
      gender = item.fetch("gender")
      animal_breed = item.fetch("animal_breed")
      date = item.fetch("date")
      animal_type = item.fetch("animal_type")
      id = item.fetch("id").to_i()
      returned_animals.push(Animal.new({:animal_name => animal_name, :gender => gender, :animal_breed => animal_breed, :date => date, :animal_type => animal_type, :id => id}))
    end
    returned_animals
  end # sort_arrival

  def adopted(customer_id_to_add, pet_id)
    @customer_id = customer_id_to_add
    @pet_id = pet_id
    DB.exec("UPDATE animal SET customer_id = '#{@customer_id}' WHERE id = '#{@pet_id}';")
    result = DB.exec("SELECT * FROM animal WHERE id = #{@pet_id};")
    updated_results = []
    result.each() do |item|
      animal_name = item.fetch("animal_name")
      gender = item.fetch("gender")
      animal_breed = item.fetch("animal_breed")
      date = item.fetch("date")
      animal_type = item.fetch("animal_type")
      id = item.fetch("id").to_i()
      customer_id = item.fetch("customer_id").to_i()
      updated_results.push(id, animal_name, gender, animal_breed, date, animal_type, customer_id) #possible to do these with other methods? Am I generating new instances in the other methods above?
    end
    updated_results
  end #adopted

end # ANIMAL
