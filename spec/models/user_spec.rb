require 'rails_helper'

RSpec.describe User, type: :model do

subject do
  described_class.new(
    :first_name => 'Testing',
    :last_name => 'McTester',
    :email => 'example@testing.com',
    :password => 'thisismypassword',
    :password_confirmation => 'thisismypassword',
    :password_digest => '123'
  )
end

  describe 'Validations' do
  it 'should save if all fields are filled out'   do
    subject.valid? 
    expect(subject.errors).to be_empty
  end

  it 'should not save when first_name is left empty' do
  subject.first_name = nil
  subject.valid?
  expect(subject.errors).not_to be_empty
  end

  it 'should not save when last_name is left empty' do
    subject.last_name = nil 
    subject.valid?
    expect(subject.errors).not_to be_empty
  end

  it 'should not save when the email field is left empty' do
    subject.email = nil 
    subject.valid?
    expect(subject.errors).not_to be_empty
  end 

  it 'should not save when password field is left empty' do
    subject.password = nil 
    subject.valid?
    expect(subject.errors).not_to be_empty
  end

  it 'should not save when the password_confirmation field is left empty' do
    subject.password_confirmation = nil 
    subject.valid?
    expect(subject.errors).not_to be_empty
  end

  it 'should not create a user if the password and the password_confirmation do not match' do
    subject.password_confirmation = 'thisisnotthepassword'
    subject.valid?
    expect(subject.errors).not_to be_empty
  end

  it 'should not allow a user to register with an email already in the system' do
    User.create(                      
      :first_name => 'Testing',
      :last_name => 'McTester',
      :email => 'example@testing.com',
      :password => 'thisismypassword',
      :password_confirmation => 'thisismypassword',
      :password_digest => '123'
    )   
  subject.valid?
  expect(subject.errors).not_to be_empty  

  end
  it 'should fail if the password is less than 8 chars ' do
  subject.password = 'badpass'
  subject.password_confirmation = 'badpass'
  subject.valid?
  expect(subject.errors).not_to be_empty
  end

  describe '.authenticate_with_credentials' do
    it ' should return the user if authentication passes'do 
    user = SessionsController.authenticate_with_credentials('example@testing.com', 'thisismypassword')
    expect(subject).eql? user
    end 

    it ' should not return the user if authentication fails'do 
    user = SessionsController.authenticate_with_credentials('example@testing.com', 'thisisnotmypassword')
    expect(subject).eql? nil
    end

end
end
end