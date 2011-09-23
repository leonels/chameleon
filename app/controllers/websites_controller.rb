class WebsitesController < ApplicationController

  #before_filter :website_layout, :only => :show
  
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
    @website = Website.find_by_subdomain!(request.subdomain)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @websites }
    end
  end

  # GET /websites/1
  # GET /websites/1.json
  def show
    # @website = Website.find(params[:id])
    if params[:id].nil?
      @website = Website.find_by_subdomain!(request.subdomain)
    else
      @website = Website.find(params[:id])
    end

    @pages = @website.pages

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @website }
    end
  end

  # GET /websites/new
  # GET /websites/new.json
  def new
    @website = Website.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @website }
    end
  end

  # GET /websites/1/edit
  def edit
    @website = Website.find(params[:id])
  end

  # POST /websites
  # POST /websites.json
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

  # PUT /websites/1
  # PUT /websites/1.json
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

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website = Website.find(params[:id])
    @website.destroy

    respond_to do |format|
      format.html { redirect_to websites_url }
      format.json { head :ok }
    end
  end
end
