require 'rails_helper'

RSpec.describe Exam, :type => :model do
  describe "date" do 
  
    it "will exit" do
      exam = Exam.create!(date: 2014-10-10)
      expect(exam.date).to eq(2014-10-10)
    end

    it "will be unique" do
      exam1, exam2 = Exam.create!(date: 2014-10-11), Exam.create!(date: 2014-10-12)
      expect(exam1.date).not_to eq(exam2.date)
    end
  end
end