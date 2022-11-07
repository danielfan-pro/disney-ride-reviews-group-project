require 'rails_helper'

feature 'Admin adds new ride' do
  scenario 'Visit the new ride form page' do

    visit new_ride_path
    expect(page).to have_button('Create Ride')

  end

  scenario 'Fill in information successfully' do
    visit new_ride_path

    fill_in 'Ride Name', with: 'Example Ride Name'
    select "Adventureland", from: 'Ride Location'
    fill_in 'Image url', with: 'https://i.gyazo.com/8440cdb48b31c51464c9b403009f4545.png'
    fill_in 'Ride Description', with: 'Example Ride Description'
    click_button 'Create Ride'

    expect(page).to have_content('Ride added successfully')

  end

  scenario 'Fill in information unsuccessfully' do
    visit new_ride_path

    fill_in 'Ride Name', with: 'Example Ride Name'
    select "Adventureland", from: 'Ride Location'
    fill_in 'Image url', with: 'https://i.gyazo.com/8440cdb48b31c51464c9b403009f4545.png'
    click_button 'Create Ride'

    expect(page).to have_content("Description can't be blank")

  end
end