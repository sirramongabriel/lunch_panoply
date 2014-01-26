require 'spec_helper'

describe Comment do
  it 'should be associated with an employee' do
  	no_employee_comment = Comment.new(employee_id: nil)
  	expect(no_employee_comment).not_to be_valid
  end

  it 'should be associated with a menu_item'

  context 'with valid credentials' do
  	it 'requires the presence of a #title' do

  	end

  	it 'requires the presence of #content' do

  	end
  end

  context 'with invalid credentials' do
  	it 'displays an error when #title is nil' do

  	end

  	it 'displays an error when #content is nil' do

  	end
  end
end
