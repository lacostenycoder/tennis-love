class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    #raise request.env["omniauth.auth"].to_yaml
    #user = User.from_omniauth(request.env["omniauth.auth"])

    p env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"])
    if user.persisted?
      #current_user = user
      sign_in(user)
      session[:user_id] = user.id
      flash[:notice] = "Signed in!"
      sign_in_and_redirect user, notice: "Signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    #binding.pry
    #handle you logic here..
    #and delegate to super.
    super
  end

  alias_method :soundcloud, :all
  alias_method :facebook, :all


  def soundcloud

    p env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"])
    if user.persisted?
      #flash[:notice] = "Signed in!"
      if user.email?
        flash[:notice] = "Signed in!"
      else
        #user.delay.get_soundcloud_artists
        flash[:notice] = "Please enter your email address to complete sign-up!"
      end
      sign_in(user)
      if user.email?
        redirect_to root_path
      else
        redirect_to edit_user_registration_url
      end

    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end

  end


  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
