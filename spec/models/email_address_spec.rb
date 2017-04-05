require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let( :email_address ) { EmailAddress.new }
  let(:email_address) {
  	EmailAddress.new(address: "john.snow@nighthack.in", person_id: 1)
  }

	it 'is valid' do
  	expect(email_address).to be_valid
	end

	it 'is invalid without an email id' do
  	email_address.address = nil
  	expect(email_address).to_not be_valid
	end

	it 'must have a reference to a person' do
    email_address.person_id = nil
    expect(email_address).not_to be_valid
  end
  
  it 'is associated with a person' do
		expect(phone_number).to respond_to(:person)
	end

end