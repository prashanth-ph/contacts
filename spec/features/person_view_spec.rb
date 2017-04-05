require 'rails_helper'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.phone_numbers.create(number: "5552221234")
    person.phone_numbers.create(number: "5553445678")
    person.email_addresses.create(address: "abc@nighthack.in")
    person.email_addresses.create(address: "def@nighthack.in")
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end
  
  it 'has a link to add a new phone number' do
    expect(page).to have_link('Add phone number', href: new_phone_number_path)
  end

  it 'adds a new phone number' do
    page.click_link('Add phone number')
    page.fill_in('Number', with: '5551238888')
    page.click_button('Create Phone number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('5552228888')
  end

  it 'shows the email addresses' do
    person.email_addresses.each do |email|
      expect(page).to have_content(email.addresses)
    end
  end
  
  it 'has a link to add a new email address' do
    expect(page).to have_link('Add email address', href: new_email_address_path)
  end

  it 'adds a new email address' do
    page.click_link('Add Email Address')
    page.fill_in('Address', with: 'abc@nighthack.in')
    page.click_button('Create email address')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('def@nighthack.in')
  end

end