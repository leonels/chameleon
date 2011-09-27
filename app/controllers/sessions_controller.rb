class SessionsController < ApplicationController
	
	skip_before_filter :authorize, :only => [:new, :create]

  # for use only for debugging
  # before_filter :clear_cookies
  
  def new
  	render :layout => "login"
  end

  def create
  	user = User.authenticate(params[:username], params[:password])
  	if user
  		#if params[:remember_me]
  		#	cookies.permanent[:auth_token] = user.auth_token
  		#else
  		#	cookies[:auth_token] = user.auth_token
  		#end
  		
  		
  		session[:user_id] = user.id
  		session[:auth_token] = user.auth_token
  		
  		website = Website.find_by_account_id(user.account_id)
  		subdomain = website.subdomain
  		
  		# redirect_to websites_url(:subdomain => website.subdomain), :notice => 'Logged in!'
  		redirect_to websites_url, :notice => 'Logged in!'
  		# redirect_to root_url(:subdomain => subdomain = website.subdomain), :notice => 'Logged in!'
  		# redirect_to root_url(:subdomain => @website.subdomain), :notice => 'Logged in!'
  		# redirect_to root_url, :notice => 'Logged in!'
  	else
  		flash.now.alert = "We didn't recognize the username or password  you entered. Please try again."
  		render 'new', :layout => "login"
  	end
  end
  
  def destroy
      cookies.delete(:auth_token)
      session.delete(:user_id)
      session.delete(:auth_token)
      redirect_to login_path, :notice => 'Logged out!'
  end
  
end
