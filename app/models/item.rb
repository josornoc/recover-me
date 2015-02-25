class Item < ActiveRecord::Base

	validates :name, presence: true, length: { in: 2..150 }
	validates :datetime, presence: true
  validates :contact_email, presence: true
  validates_format_of :contact_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  scope :has_reward,  -> { where("reward IS NOT NULL").order("datetime DESC") }
  scope :lost, 		 		-> { where(state: "lost").order("datetime DESC") }
  scope :found,				-> { where(state: "found").order("datetime DESC") }
  scope :resolved, 		-> { where(state: "resolved").order("datetime DESC") }

	belongs_to :user

end
