require 'rails_helper'

RSpec.describe Person, :type => :model do
  it 'is invalid without a first name' do
    person = Person.new(first_name: nil)
    expect(person).not_to be_valid
  end
  
  it 'is invalid without a last name' do
  	person = Person.new(first_name: 'Bob', last_name: nil)
  	expect(person).not_to be_valid
	end

	it 'has an array of phone numbers' do 
		expect(person.phone_numbers).to eq([])
	end

  it 'has an array of email ids' do
    expect(person.email_address).to eq([])
  end
end
