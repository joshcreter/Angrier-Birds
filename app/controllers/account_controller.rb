class AccountController < ApplicationController
  def index
    @services = current_user.services.order('provider asc')
    account = current_user

  end

end
