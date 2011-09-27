class Admin::GalleriesController < AdminController

  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @photos = Photo.all(:conditions => ["gallery_id == ?", params[:id]], :order => "created_at DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @gallery = Gallery.new

    unless params[:page_id]
      @pages = Page.all
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
    @pages = Page.all
  end

  # POST /galleries
  # POST /galleries.json
  def create
    # @gallery = Gallery.new(params[:gallery])
    @gallery = Gallery.new(params[:gallery])
    @gallery.page_id = params[:page_id]

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to admin_galleries_url }
      format.json { head :ok }
    end
  end
end
