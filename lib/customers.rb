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
    self.customer_name().==(another_customer.customer_name()).&(self.id().==(another_customer.id()))
  end

  def customer_name
    @customer_name
  end

  def id
    @id
  end

  def self.all()
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each() do |item|
      customer_name = item.fetch("customer_name")
      phone = item.fetch("phone")
      animal_type_preference = item.fetch("animal_type_preference")
      breed_preference = item.fetch("breed_preference")
      id = item.fetch("id").to_i()
      customers.push(Customers.new({:customer_name => customer_name, :phone => phone, :animal_type_preference => animal_type_preference, :breed_preference => breed_preference, :id => id}))
    end
    customers
  end #all

  def save
    DB.exec("INSERT INTO customers(customer_name, phone, animal_type_preference, breed_preference, id) VALUES ('#{@customer_name}', '#{@phone}', '#{@animal_type_preference}', '#{@breed_preference}', #{@id});")
  end #save
end #Customer
