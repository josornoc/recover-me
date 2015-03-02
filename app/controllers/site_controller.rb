class SiteController < ApplicationController
	def index
		@current_user = current_user
		@user = User.new
	end

	def search
		@items = Item.search(params[:search])
	end
end

#<%= link_to "Log out", logout_path, method: :delete, class: "navbar-text" %>
#<p class="navbar-text">Signed in as <%= @user.name %></p>
