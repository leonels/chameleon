class Admin::PhotosController < AdminController
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    # @photo = Photo.new
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.find(params[:id])
  end

  def create
    # @photo = Photo.new(params[:photo])
    @gallery = Gallery.find(params[:gallery_id])
    # @photo = @gallery.photos.build
    @photo = @gallery.photos.build(params[:photo])

    respond_to do |format|
      if @photo.save
        # format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.html { redirect_to gallery_path(@gallery), notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        # format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.html { redirect_to gallery_photo_path(@photo), notice: 'Photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to gallery_url(@photo.gallery_id) }
      # format.html { redirect_to photos_url }
      # format.json { head :ok }
    end
  end
end
