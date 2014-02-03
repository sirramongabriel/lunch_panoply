require 'spec_helper'

describe Admin do
  let(:admin) { create :admin }

  it 'has a valid factory' do
    expect(admin).to be_valid
  end

  context 'with valid attributes' do
    it { should allow_mass_assignment_of(:email) }

    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:email) }

    it { should allow_value("example@test.com").for(:email) }

    it { should_not allow_value("invalid").for(:email) }

    # it { should_not allow_mass_assignment_of(:password) }

    it { should validate_presence_of(:password) }

    it { should ensure_length_of(:password).is_at_least(8).is_at_most(128) }

    it { should validate_confirmation_of(:password) }

    # it { should_not allow_mass_assignment_of(:password_confirmation) }
  end

  context 'with invalid attributes' do
    it 'displays an error when #email is empty' do
      admin.email = nil
      expect(admin).to have(2).errors_on(:email)
    end

    it 'displays an error when #password is empty' do
      admin.password = nil
      expect(admin).to have(3).errors_on(:password)
    end

    it 'displays an error when #password_confirmation is empty' do
      admin.password_confirmation = nil
      expect(admin).to have(1).error_on(:password_confirmation)
    end

    it 'dislpays an error when #password is less than 8 characters' do
      admin.password = '1234567'
      expect(admin).to have(3).errors_on(:password)
    end

    it 'displays an error when #password is more than 128 characters' do 
      admin.password = rand(2 ** 1234).to_s
      expect(admin).to have(3).errors_on(:password)
    end

    it 'displays an error when #password_confirmation does not match #password' do
      admin.password = '12345678'
      admin.password_confirmation = 'password'
      expect(admin).to have(1).error_on(:password)
    end
  end 
end
