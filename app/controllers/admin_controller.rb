# class Admin::BaseController < ApplicationController
class AdminController < ApplicationController

  protect_from_forgery

  layout 'admin/application'
  
  include UrlHelper

  helper_method :current_user

  before_filter :authorize

  helper_method :unread_messages_count
  
  # helper_method :current_website
  # root_url(:subdomain => @website.subdomain)
  # root_url(:subdomain => false)

  
  def website_layout
    unless request.subdomain.empty?
      website = Website.find_by_subdomain(request.subdomain)
      if website.layout_name.nil?
        self.class.layout 'plain'
      else
        self.class.layout website.layout_name
      end 
    end
  end
  
  private
 
  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]

    # if cookies[:auth_token]
    # if session[:auth_token]
    if session[:user_id]
    	# @current_user = User.find_by_auth_token!(cookies[:auth_token])
    	# @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    	# @current_user ||= User.find_by_id!(cookies[:id]) if cookies[:id]
    	# @current_user ||= User.find_by_id!(session[:auth_token]) if session[:auth_token]
    	@current_user ||= User.find_by_id!(session[:user_id]) if session[:user_id]
    # else
    #   current_user = User.new
    #   @current_user = current_user
    end
  end

  # def current_website
    # @website = Website.find_by_account_id(current_user.account.id)
    # unless request.subdomain.empty?
    #   @website = Website.find_by_subdomain!(request.subdomain)
    # end
  # end

  def authorize
  	if current_user.nil?
  		redirect_to admin_login_path, :notice => 'Please log in'
  	end
  end

  def unread_messages_count
    Message.all(:conditions => ['website_id = ? AND read_at = ?', current_website.id, nil]).count
  end

end
