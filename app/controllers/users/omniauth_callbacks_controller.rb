class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include SocialsHelper
  #require 'uuidtools'

  def facebook
    oauthorize "facebook"
  end
  
  def instagram
    oauthorize "instagram"
  end
  
  def linkedin
    oauthorize "linkedin"
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

private

  def oauthorize(kind)
    @user = find_for_ouath(kind, request.env["omniauth.auth"], current_user)
    if @user.save
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => kind
      session["devise.#{kind.downcase}_data"] = request.env["omniauth.auth"]
      sign_in_and_redirect @user, :event => :authentication
    end
  end

  def find_for_ouath(provider, access_token, resource=nil)
    if ["instagram", "facebook", "linkedin"].include? provider  
      auth_attr = attr_social(provider, access_token)
    else
      raise "#{provider} aun no lo usamos"
    end
    
    user = resource

    auth = user.socials.find_by_provider(provider)
    if auth.nil?
      auth = user.socials.build(provider: provider)
      user.socials << auth
    end
    auth.update_attributes auth_attr
    return user
  end
end
