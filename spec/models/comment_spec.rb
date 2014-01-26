require 'spec_helper'

describe Comment do
	context 'with valid credentials' do
	  it 'requires the presence of a #title' do
	  	comment = build :comment
	  	expect(comment).to have(0).errors_on :title
	  end

	  it 'requires the presenece of #content' do
	  	comment = build :comment
	  	expect(comment).to have(0).errors_on :content
	  end
	end

	context 'with invalid credentials' do
		it 'will display an error when #title has a nil value' do
			comment = build :comment
			comment.title = nil
			expect(comment).to have(1).error_on :title
		end

		it 'will display an error when #conent has a nil value' do
			comment = build :comment
			comment.content = nil
			expect(comment).to have(1).error_on :content
		end
	end
end
