class Item < ActiveRecord::Base

	validates :name, presence: true, length: { in: 2..150 }
	validates :datetime, presence: true
  validates :contact_email, presence: true
  validates_format_of :contact_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  scope :has_reward,  -> { where("reward IS NOT NULL").order("datetime DESC") }
  scope :lost, 		 		-> { where(state: "lost").order("datetime DESC") }
  scope :found,				-> { where(state: "found").order("datetime DESC") }
  scope :resolved, 		-> { where(state: "resolved").order("datetime DESC") }
  
  has_many :relations
  has_many :owners
  has_many :founders
  has_many :questions
  has_many :users, through: :relations
  
  accepts_nested_attributes_for :relations
  accepts_nested_attributes_for :questions

  def is_lost?
    return true if (state == "Lost")
  end

  def is_found?
    return true if (state == "Found")
  end

  def is_resolved?
    return true if (state == "Resolved")
  end
end