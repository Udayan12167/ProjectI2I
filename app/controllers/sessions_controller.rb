class SessionsController < ApplicationController
  def create
    user=User.from_omniauth(env["omniauth.auth"])

    session[:user_id] = user.id
    #session['fb_auth']=user
    session['fb_access_token']=user.oauth_token
    session['fb_error']=nil
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    session['fb_auth']=nil
    session['fb_access_token']=nil
    redirect_to root_url
  end
end
