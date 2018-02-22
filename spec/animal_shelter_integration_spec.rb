require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('', {:type => :feature}) do
#   it('shows no animal list if ') do
#     visit('')
#     fill_in('', :with => '')
#     click_button('')
#     expect(page).to have_content('')
#   end
# end
