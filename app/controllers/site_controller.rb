class SiteController < ApplicationController
	def index
		#@user = User.where(id: session[:logged_in_user])
		#@items = Item.all.reverse
		#is_logged?
		@current_user = current_user
		if @current_user
			# redireccionar a reportar nuevo elemento
			# redirect_to new_item_path(@current_user)
		end
	end

	def search

	end
end

#<%= link_to "Log out", logout_path, method: :delete, class: "navbar-text" %>
#<p class="navbar-text">Signed in as <%= @user.name %></p>
