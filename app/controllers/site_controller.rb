class SiteController < ApplicationController
	def index
    @user = nil
    if(session[:logged_in_user])
      @user = User.where(id: session[:logged_in_user])
    end
		@items = Item.all.reverse
	end
end

#<%= link_to "Log out", logout_path, method: :delete, class: "navbar-text" %>
#<p class="navbar-text">Signed in as <%= @user.name %></p>
