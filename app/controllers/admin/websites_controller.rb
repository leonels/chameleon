# class Admin::WebsitesController < Admin::BaseController
# class Admin::WebsitesController < ApplicationController
class Admin::WebsitesController < AdminController
  #before_filter :website_layout, :only => :show
  load_and_authorize_resource
  #def website_layout
  #  website = Website.find_by_subdomain(request.subdomain)
  #  if website.layout_name.nil?
  #    self.class.layout 'plain'
  #  else
  #    self.class.layout website.layout_name
  #  end
  #end

  def index
    @websites = Website.all(:conditions => ["account_id == ?", current_user.account_id])
    # @website = Website.find_by_subdomain!(request.subdomain)

    respond_to do |format|
      format.html
    end
  end

  def show
    # @website = Website.find(params[:id])
    if params[:id].nil?
      @website = Website.find_by_subdomain!(request.subdomain)
    else
      @website = Website.find(params[:id])
    end

    @pages = @website.pages

    respond_to do |format|
      format.html
    end
  end

  def new
    @website = Website.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @website }
    end
  end

  def edit
    @website = Website.find(params[:id])
  end

  def create
    @website = Website.new(params[:website])

    respond_to do |format|
      if @website.save
        format.html { redirect_to @website, notice: 'Website was successfully created.' }
        format.json { render json: @website, status: :created, location: @website }
      else
        format.html { render action: "new" }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @website = Website.find(params[:id])

    respond_to do |format|
      if @website.update_attributes(params[:website])
        format.html { redirect_to @website, notice: 'Website was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @website = Website.find(params[:id])
    @website.destroy

    respond_to do |format|
      format.html { redirect_to websites_url }
      format.json { head :ok }
    end
  end
end
