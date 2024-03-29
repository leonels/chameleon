class Admin::LocationsController < AdminController
  load_and_authorize_resource
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  def edit
    # @location = Location.find(params[:id])
  end

  def create
    # @location = Location.new(params[:location])
    @location.page_id = params[:page_id]
    
    respond_to do |format|
      if @location.save
        format.html { redirect_to edit_admin_page_url(params[:page_id]), notice: 'Location was successfully created.' }
        # format.html { redirect_to @location, notice: 'Location was successfully created.' }
        # format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        # format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :ok }
    end
  end
end
