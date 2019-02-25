class WebSiteMailer < ApplicationMailer

  # Send email when user is signed up.
  def user_signed_up_email(user_id)
    @user = User.find(user_id)

    if @user.email == nil
      return
    end

    @subject_line = "Welcome!"

    mail(to: @user.email, subject: @subject_line)
  end

end