class Admin::MessagesController < AdminController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
    end
  end

  def show
    # @message = Message.find(params[:id])
    @message.update_attributes(:read_at => Time.now)
    respond_to do |format|
      format.html
      # format.json { render json: @message }
    end
  end

  def new
    # @message = Message.new
    respond_to do |format|
      format.html
      # format.json { render json: @message }
    end
  end

  # def edit
    # @message = Message.find(params[:id])
  # end

  def create
    # @message = Message.new(params[:message])
    website = Website.find_by_subdomain(request.subdomain)
    @message.website_id = website.id
    
    # set to website owner email
    @message.to = 'leonelsantos.me@gmail.com'
    @message.subject = "From your Website " + website.name

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        # format.html { render :controller => "pages", :action => "show" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
    # @message = Message.find(params[:id])
    # respond_to do |format|
      # if @message.update_attributes(params[:message])
        # format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        # format.json { head :ok }
      # else
        # format.html { render action: "edit" }
        # format.json { render json: @message.errors, status: :unprocessable_entity }
      # end
    # end
  # end

  def destroy
    # @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to admin_messages_url }
      format.json { head :ok }
    end
  end
end
