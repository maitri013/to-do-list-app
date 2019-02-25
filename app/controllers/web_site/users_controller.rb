class WebSite::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def sign_up
    @user = User.new
  end

  def user_signed_up
    lower_case_email = params[:email].downcase
    if params[:email] != lower_case_email
      redirect_to web_site_user_sign_up_path, alert: "Email should be in lower case."
    else
      @user = User.create name: params[:name], email: params[:email], password: params[:password]
      if @user.save
        WebSiteMailer.user_signed_up_email(@user.id).deliver_later
        redirect_to web_site_to_do_list_index_path(@user.id)
      else
        render "sign_up"
      end
    end
  end

  def login
    @user = User.new
  end

  def user_logged_in
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      redirect_to web_site_to_do_list_index_path(@user.id)
    else
      redirect_to web_site_user_login_path, alert: "Incorrect email or password"
    end
  end

end