class AppController < ApplicationController
  before_filter :require_user
#before_filter :authenticate_user!, :except => [:index]

  layout false
end