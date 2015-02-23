class SiteController < ApplicationController
	def index
		@user = User.where(id: session[:logged_in_user])
		@items = Item.all.reverse
	end
end
