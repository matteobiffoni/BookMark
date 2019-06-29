class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if user_signed_in? && (!current_user.provider || current_user.provider.empty?) && (!current_user.uid || current_user.uid.empty?)
      if current_user.link_account_from_omniauth(request.env["omniauth.auth"])
        flash[:notice] = "Account collegato correttamente"
        redirect_to root_path and return
      end
    end
  end
  def failure
    redirect_to root_path
  end
end
