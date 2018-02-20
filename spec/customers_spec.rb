require("spec_helper")
require("rspec")
require('pg')
require('customers')

describe(Customers) do
  describe('#==') do
    it('is the same customer if the names are the same') do
      one = Customers.new({:customer_name => 'Susan', :phone => '503-333-3434', :animal_type_preference => 'dog', :breed_preference => 'Rottweiler', :id=> 1})
      two = Customers.new({:customer_name => 'Susan', :phone => '503-333-3434', :animal_type_preference => 'dog', :breed_preference => 'Rottweiler', :id=> 1})
      expect(one).to(eq(two))
    end
  end # ==

  describe('.all') do
    it('empty at first, but will populate later.') do
      expect(Customers.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a customer to an array of customers') do
      first_customer = Customers.new({:customer_name => 'Susan', :phone => '503-333-3434', :animal_type_preference => 'dog', :breed_preference => 'Rottweiler', :id=> 1})
      first_customer.save
      expect(Customers.all()).to(eq([first_customer]))
    end
  end # save

end #Customers
