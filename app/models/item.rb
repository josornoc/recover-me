class Item < ActiveRecord::Base

	validates :name, presence: true, length: { in: 2..255 }
	validates :datetime, presence: true
  validates :contact_email, presence: true
  validates_format_of :contact_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  scope :hasReward,  -> { where("reward IS NOT ? AND unit_id IS NOT ?", nil, nil).order("datetime DESC") }
  scope :isLost, 		 -> { where("state IS ? AND unit_id IS NOT ?", "lost", nil).order("datetime DESC") }
  scope :isFound,		 -> { where("state IS ? AND unit_id IS NOT ?", "found", nil).order("datetime DESC") }
  scope :isResolved, -> { where("state IS ? AND unit_id IS NOT ?", "resolved", nil).order("datetime DESC") }

end
