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
    self.customer_name().==(another_customer.customer_name()).&(self.id().==(another_customer.id())).&(self.phone().==(another_customer.phone())).&(self.animal_type_preference().==(another_customer.animal_type_preference())).&(self.breed_preference().==(another_customer.breed_preference()))
  end

  def save
    result = DB.exec("INSERT INTO customers(customer_name, phone, animal_type_preference, breed_preference) VALUES ('#{@customer_name}', '#{@phone}', '#{@animal_type_preference}', '#{@breed_preference}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
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

  def return_breed_preference(preference)
    @preference = preference
    returned_customers = []
    current_results = DB.exec("SELECT * FROM customers WHERE breed_preference = '#{@preference}';")
    current_results.each() do |item|
      customer_name = item.fetch("customer_name")
      phone = item.fetch("phone")
      animal_type_preference = item.fetch("animal_type_preference")
      breed_preference = item.fetch("breed_preference")
      id = item.fetch("id").to_i()
      returned_customers.push(Customers.new({:customer_name => customer_name, :phone => phone, :animal_type_preference => animal_type_preference, :breed_preference => breed_preference, :id => id}))
    end
    returned_customers
  end #breed_preference

end #Customer
