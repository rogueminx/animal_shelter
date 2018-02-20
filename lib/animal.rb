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
