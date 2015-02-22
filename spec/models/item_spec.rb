require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Validations" do
    it "validates presence of name" do
      item = build(:item, name: nil)
      expect(item.valid?).to be false
      expect(item.errors[:name].present?).to be true
    end
  end
end
