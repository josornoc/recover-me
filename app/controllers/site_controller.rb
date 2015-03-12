class SiteController < ApplicationController
	def index
		@current_user = current_user
		@user = User.new
	end

	def search
		@items = Item.search(params[:search])
	end

  def report
    @item = Item.new
  end
end
