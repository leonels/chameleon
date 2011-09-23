class FormsController < ApplicationController
  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forms }
    end
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
    @form = Form.new
    @pages = Page.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
    @pages = Page.all
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(params[:form])
    
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

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find(params[:id])

    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form = Form.find(params[:id])
    @form.destroy

    respond_to do |format|
      format.html { redirect_to website_url(current_website), notice: 'Form has been deleted.' }
      # format.html { redirect_to forms_url }
      format.json { head :ok }
    end
  end
end
