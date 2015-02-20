require 'test_helper'
require 'rspec/rails'
require 'shoulda/matchers'

# class ItemTest < ActiveSupport::TestCase
# 	describe Item do
# 	  it { should validate_presence_of(:name) }
# 	  it { should validate_presence_of(:datetime) }
# 	  it { should validate_presence_of(:contact_email) }
# 	end
# end

describe Item do

  it { should validate_presence_of( :name ) }
  it { should validate_presence_of( :datetime ) }
  it { should validate_presence_of( :contact_email ) }

end