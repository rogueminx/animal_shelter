require("spec_helper")
require("rspec")
require('pg')
require('customers')

describe(Customers) do
  describe('#==') do
    it('is the same customer if the names and id are the same') do
      one = Customers.new({:customer_name => 'Susan', :phone => '503-333-3434', :animal_type_preference => 'dog', :breed_preference => 'Rottweiler', :id=> nil})# doesn't have id yet because haven't saved to db; don't know what db will assign it, nil for testing instances.
      two = Customers.new({:customer_name => 'Susan', :phone => '503-333-3434', :animal_type_preference => 'dog', :breed_preference => 'Rottweiler', :id=> nil})
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
      first_customer = Customers.new({:customer_name => 'Susan', :phone => '503-333-3434', :animal_type_preference => 'dog', :breed_preference => 'Rottweiler', :id=> nil})
      first_customer.save
      expect(Customers.all()).to(eq([first_customer]))
    end
  end # save

  describe('#breed_preference') do
    it('returns owners with a certain breed preference') do
      first_customer = Customers.new({:customer_name => 'Susan', :phone => '503-333-3434', :animal_type_preference => 'dog', :breed_preference => 'Rottweiler', :id=> nil})
      first_customer.save
      second_customer = Customers.new({:customer_name => 'Penelope', :phone => '412-542-1124', :animal_type_preference => 'cat', :breed_preference => 'Persian', :id=> nil})
      second_customer.save
      third_customer = Customers.new({:customer_name => 'Bill', :phone => '612-607-8921', :animal_type_preference => 'dog', :breed_preference => 'Rottweiler', :id=> nil})
      third_customer.save
      expect(third_customer.breed_preference('Rottweiler')).to(eq([first_customer, third_customer]))
    end
  end # save

end #Customers
