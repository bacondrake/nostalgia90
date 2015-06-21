require 'rails_helper'

RSpec.describe Ntcmarshals, :type => :model do
  describe "marshal name" do
    it "exists" do
      marshal = Ntcmarshal.create!(name: "John Smith")
      expect(marshal.name).to eq("John Smith")
    end

    it "is unique" do
      marshal1, marshal2 = Ntcmarshal.create!(name: "John Smith"), Ntcmarshal.create!(name: "Jane Doe")
      expect(marshal1.name).not_to eq(marshal2.name)
    end
  end
end
