class Admin::FormsController < AdminController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
    end
  end

  def show
    # @form = Form.find(params[:id])
    respond_to do |format|
      format.html
      # format.json { render json: @form }
    end
  end

  def new
    # @form = Form.new
    @pages = Page.all

    respond_to do |format|
      format.html
      # format.json { render json: @form }
    end
  end

  def edit
    # @form = Form.find(params[:id])
    @pages = Page.all
  end

  def create
    # @form = Form.new(params[:form])
    
    if params[:page_id]
      @form.page_id = params[:page_id]
    end
    @form.website_id = current_website.id

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        # format.json { render json: @form, status: :created, location: @form }
      else
        format.html { render action: "new" }
        # format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # @form = Form.find(params[:id])
    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        # format.json { head :ok }
      else
        format.html { render action: "edit" }
        # format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @form = Form.find(params[:id])
    @form.destroy
    respond_to do |format|
      format.html { redirect_to admin_website_url(current_website), notice: 'Form has been deleted.' }
      # format.html { redirect_to forms_url }
      # format.json { head :ok }
    end
  end
end
