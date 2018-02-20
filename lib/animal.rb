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
