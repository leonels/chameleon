class GalleryImagesController < ApplicationController
  # GET /gallery_images
  # GET /gallery_images.json
  def index
    @gallery_images = GalleryImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gallery_images }
    end
  end

  # GET /gallery_images/1
  # GET /gallery_images/1.json
  def show
    @gallery_image = GalleryImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery_image }
    end
  end

  # GET /gallery_images/new
  # GET /gallery_images/new.json
  def new
    # @gallery_image = GalleryImage.new
    @gallery = Gallery.find(params[:gallery_id])
    @gallery_image = @gallery.gallery_images.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery_image }
    end
  end

  # GET /gallery_images/1/edit
  def edit
    @gallery_image = GalleryImage.find(params[:id])
  end

  # POST /gallery_images
  # POST /gallery_images.json
  def create
    # @gallery_image = GalleryImage.new(params[:gallery_image])
    @gallery = Gallery.find(params[:gallery_id])
    @gallery_image = @gallery_image.gallery_images.build(params[:image])

    respond_to do |format|
      if @gallery_image.save
        format.html { redirect_to @gallery_image, notice: 'Gallery image was successfully created.' }
        format.json { render json: @gallery_image, status: :created, location: @gallery_image }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gallery_images/1
  # PUT /gallery_images/1.json
  def update
    @gallery_image = GalleryImage.find(params[:id])

    respond_to do |format|
      if @gallery_image.update_attributes(params[:gallery_image])
        format.html { redirect_to @gallery_image, notice: 'Gallery image was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_images/1
  # DELETE /gallery_images/1.json
  def destroy
    @gallery_image = GalleryImage.find(params[:id])
    @gallery_image.destroy

    respond_to do |format|
      format.html { redirect_to gallery_images_url }
      format.json { head :ok }
    end
  end
end
