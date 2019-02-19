class WebSite::UsersController < ApplicationController

  def sign_up
  end

  def user_signed_up
    @user = User.find_or_create_by name: params[:name], email: params[:email], password: params[:password]
    if @user.save
      redirect_to web_site_to_do_list_index_path(@user.id)
    else
      render "sign_up"
    end
  end

  def login
  end

  def user_logged_in
  end

end