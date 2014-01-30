require 'spec_helper'

describe Comment do
  let(:comment) { create :comment }

	it { should belong_to(:employee) }

  it { should belong_to(:menu_item) }


  context 'with valid credentials' do
  	it { should validate_presence_of(:title) }

  	it { should validate_presence_of(:content) }
  end

  context 'with invalid credentials' do
  	it 'displays an error when #title is nil' do
  		comment.title = nil
  		expect(comment).to have(1).error_on(:title)
  	end

  	it 'displays an error when #content is nil' do
  		comment.content = nil
  		expect(comment).to have(1).error_on(:content)
  	end
  end
end
