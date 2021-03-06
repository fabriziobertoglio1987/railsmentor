require 'rails_helper'

RSpec.describe Question, type: :model do
	
	let(:question) { question = FactoryGirl.build(:question) }
	let(:invalid_question) { invalid_question = FactoryGirl.build(:invalid_question) }	
	
	describe "maximum tags" do
		it "should be valid with few tags" do
			expect(question).to be_valid
		end

		it "should be an invalid question with too many tags" do
			expect(invalid_question).to_not be_valid
		end
	end

	describe "maximum_tag_length" do
		it "should have a maximum tag length" do
			question.tags[0] = "this-is-a-very-long-tag-that-will-trigger-an-error"
			expect(question).to_not be_valid
		end
	end

	describe "stripped_minimum" do 
		it "should not be a valid question body" do 
			question.body = "        this     is a too          short question"
			expect(question).to_not be_valid
		end

		it "is a valid question body" do
			question.body = "This is a    valid question body it has 30 character length"
			expect(question).to be_valid
		end
	end
end
