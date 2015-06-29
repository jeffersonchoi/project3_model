require 'rails_helper'

RSpec.feature "Pages", type: :feature do
  scenario "Home" do
   visit '/stops'
   click_link "Home"
   expect(page).to have_content("Phone: 123-456-7899")
  end

  scenario "valid about pages" do
   visit '/stops'
   click_link "About"
   expect(page).to have_content("Control Your Own Time")
  end

  scenario "valid Contact" do
   visit '/stops'
   click_link "Contact"
   click_link "Contact"
   expect(page).to have_content("Contact Us")
  end

  scenario "valid Bus Routes" do
   visit '/stops'
   click_link "Bus Routes"
   expect(page).to have_content("Route 704")
  end



end
