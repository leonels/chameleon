class ContactController < ApplicationController

  before_filter :website_layout

  def new
    @website = Website.find_by_subdomain(request.subdomain)
    @pages = Page.where("website_id = ?", @website.id)
    
    # @page = Page.new
    # @page.title = 'Contact'
    
    @message = Message.new
  end

  def create
    # @website = Website.find_by_subdomain(request.subdomain)
    # @pages = Page.where("website_id = ?", @website.id)
    @pages = Page.where("website_id = ?", current_website.id)

    @message = Message.new(params[:message])
    # @message.website_id = @website.id
    @message.website_id = current_website.id
    # set to website owner email
    # @message.to = 'leonelsantos.me@gmail.com'
    @message.to = current_website.account.users[0].email
    # @message.to = current_user.email
    # set to web app email
    @message.from = 'leonelsantos.me@gmail.com'

    # @page = Page.new
    # @page.title = 'Contact'
    @page = Page.find_by_permalink(params[:permalink])
 
    if @message.valid?
      @message.save
      # MessengerMailer.new_message(@message).deliver
      # Messenger.website_message(@website, @message).deliver
      Messenger.website_message(current_website, @message).deliver
      # Messenger.website_message_thank_you(@website, @message).deliver
      Messenger.website_message_thank_you(current_website, @message).deliver
      
      # to do
      # change redirect url
      
      # redirect_to(page_path(@page), :notice => "Message was successfully sent.")
      # redirect_to(request.referrer, :notice => "Message was successfully sent.")
      redirect_to(page_path(@page), :notice => "Message was successfully sent.")
      
    else
      flash.now.notice = "Please fill all fields."
      # render 'pages/' + 'show_' + website.layout_name
      # render params[:permalink]
      # render 'pages/show'
      # render :controller=> :pages, :action=>:show
      # render :new
      render :template => 'pages/show_' + current_website.layout_name
      # redirect_to('http://leonelonrails.lvh.me:3000/staff', :notice => "Please fill required fields.")
    end
  end

end
