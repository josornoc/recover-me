require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do

  describe "Validations" do

    ############## name
    it "validates presence of name" do
      item = build(:item, name: nil)
      expect(item.valid?).to be false
      expect(item.errors[:name].present?).to be true
    end

    it "validates length of name" do
      item = build(:item, name: Faker::Lorem.characters(1))
      expect(item.valid?).to be false
      expect(item.errors[:name].present?).to be true
    end

    it "validates length of name" do
      item = build(:item, name: Faker::Lorem.characters(151))
      expect(item.valid?).to be false
      expect(item.errors[:name].present?).to be true
    end

    # Name :must eval only alphanumeric chars

    ##############
    it "validates presence of datetime" do
      item = build(:item, datetime: nil)
      expect(item.valid?).to be false
      expect(item.errors[:datetime].present?).to be true
    end

    # Should be a date with the possibility of time as well.

    ##############
    it "validates presence of datetime" do
      item = build(:item, contact_email: nil)
      expect(item.valid?).to be false
      expect(item.errors[:contact_email].present?).to be true
    end
  end

  # testing scopes directly not neccesary
  # http://stackoverflow.com/questions/6485379/testing-named-scopes-with-rspec

  # describe "Scopes" do
  #   it "lists items with rewards" do
  #     item = build(:item, reward: 10)
  #     binding.pry
  #     expect(Item.hasReward).to include(item)
  #   end
  # end
end
