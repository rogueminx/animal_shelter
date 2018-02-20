class Customers

  attr_accessor(:phone, :animal_type_preference, :breed_preference)
  attr_reader(:customer_name, :id)

  def initialize(attributes)
    @customer_name = attributes.fetch(:customer_name)
    @phone = attributes.fetch(:phone)
    @animal_type_preference = attributes.fetch(:animal_type_preference)
    @breed_preference = attributes.fetch(:breed_preference)
    @id = attributes.fetch(:id)
  end

  def ==(another_customer)

  end

end
