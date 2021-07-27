class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def twitter
    callback_for(:twitter)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.form_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      flash[:notice] = "登録済みメールアドレスの可能性があります"
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
