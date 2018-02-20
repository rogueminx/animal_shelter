class Customers
  @@customer_list = []

  def initialize(attributes)
    @customer_name = attributes.fetch(:customer_name)
    @phone = attributes.fetch(:phone)
    @animal_type_preference = attributes.fetch(:animal_type_preference)
    @breed_preference = attributes.fetch(:breed_preference)
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
