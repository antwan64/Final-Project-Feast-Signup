class UsersController < ApplicationController
  before_action :authenticate_user!

  def signed_up_items
    @signed_up_items = UserMenuItem.where({ :user_id => current_user.id })
    render({ :template => "users/signed_up_items" })
  end
end
