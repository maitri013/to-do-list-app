class WebSite::BaseController < ApplicationController

  before_action :load_user

  private

  def load_user
    @user = User.find(params[:id])
  end
end