# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      if params["user"]
        user.first_name = params["user"]["first_name"]
        user.last_name = params["user"]["last_name"]
        user.save
      end
    end
  end
end
