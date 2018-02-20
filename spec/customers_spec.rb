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

end #Customers
