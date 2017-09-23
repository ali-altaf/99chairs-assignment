require 'rails_helper'

RSpec.describe Name, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(Name.new).to be_valid
    end

    it "is not valid without First Name" do
      name = Name.new(first_name: nil)
      expect(name).to_not be_valid
    end

    it "it is valid without a count" do
      name = Name.new(first_name: "Ali", count: nil)
      expect(name).to be_valid
    end
  end
end
