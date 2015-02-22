require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "Validations" do
    it "validates presence of name" do
      item = build(:item, name: nil)
      expect(cat.valid?).to be false
      expect(cat.errors[:name].present?).to be true
    end
  end
end
