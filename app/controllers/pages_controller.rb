class PagesController < ApplicationController

  before_filter :website_layout, :only => :show
  # before_filter :current_website
  skip_before_filter :authorize, :only => [:show]
  
  #def website_layout
  #  website = Website.find_by_subdomain(request.subdomain)
  #  if website.layout_name.nil?
  #    self.class.layout 'plain'
  #  else
  #    self.class.layout website.layout_name
  #  end
  #end

  def index
    # @pages = Page.all
#    if params[:website_id]
#      @pages = Page.where("website_id = ?", params[:website_id])
#    else
#      @pages = Page.all
#    end

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @pages }
#    end
    if params[:id]
      @page = Page.find(params[:id])
    else
      @page = Page.find_by_page_type('homepage')  
    end

    # @page = Page.find(params[:id])
    @website = Website.find_by_subdomain(request.subdomain)
    @pages = Page.where("website_id = ?", @website.id)

    respond_to do |format|
      unless website_layout == 'plain'
        website = Website.find_by_subdomain(request.subdomain)
        format.html { render :action => "show_" + website.layout_name }
      else
        format.html
      end
      # format.json { render json: @page }
    end

  end

  def show
    if params[:permalink]
      @page = Page.find_by_permalink_and_website_id(params[:permalink], current_website.id)
      raise ActiveRecord::RecordNotFound, "Page not found: " + params[:permalink] if @page.nil?
    elsif params[:id]
      @page = Page.find(params[:id])
    else
      @page = Page.find_by_permalink_and_website_id('homepage', current_website.id)
      # result = Page.all(:conditions => ['website_id = ? AND title = "homepage"', current_website.id])
      # should redirect to homepage
      # redirect_to login_path, :notice => 'Please log in'
      # return
    end

    # @website = Website.find_by_subdomain(request.subdomain)
    @pages = Page.where("website_id = ?", current_website.id)

    @message = Message.new
    # owner = User.find_by_account_id(@website.account_id)
    owner = User.find_by_account_id(current_website.account_id)
    @to = owner.email
    # @subject = "From your Website: " + @website.name
    @subject = "From your Website: " + current_website.name

    respond_to do |format|
      # unless @website.layout_name.nil?
      unless current_website.layout_name.nil?
        # website = Website.find_by_subdomain(request.subdomain)
        # format.html { render :action => "show_" + @website.layout_name }
        format.html { render :action => "show_" + current_website.layout_name }
      else
        format.html
      end
      # format.json { render json: @page }
    end
  end

  def new
    @website = Website.find(params[:website_id])
    @page = @website.pages.build

    # @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    # @page = Page.new(params[:page])
    @website = Website.find_by_subdomain(request.subdomain)
    # @website = Website.find(params[:website_id])
    @page = @website.pages.build(params[:page])

    # YOU ALSO NEED TO TRIM ANYTHING OTHER THAN ALPHANUMERIC CHARACTERS OR DASHES
    # DO THE SAME ON update
    trimmed = @page.title.gsub(/\s+/,"")
    downcased = trimmed.downcase
    @page.permalink = downcased

    respond_to do |format|
      if @page.save
        format.html { redirect_to website_url(@website), notice: 'Page was successfully created.' }
        # format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])
    if params[:remove_map]
      location = Location.find(params[:remove_map])
      location.destroy
    end

    respond_to do |format|
      if @page.update_attributes(params[:page])
        # format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.html {
          flash[:notice] = 'Page was successfully updated.'
          render :edit
        }
        # format.html { redirect_to :action => "edit", :id => params[:id], notice: 'Page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      # format.html { redirect_to pages_url }
      format.html { redirect_to website_url(@website) }
      format.json { head :ok }
    end
  end
  
  # should move to application controller
  # private
  # def current_website
  #   unless request.subdomain.empty?
  #     @website = Website.find_by_subdomain!(request.subdomain)
  #   end
  # end

end
