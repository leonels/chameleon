class AccountsController < ApplicationController

  skip_before_filter :authorize, :only => [:new, :create]

  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  def new
    @account = Account.new
    @account.users.build
    @account.websites.build
    # @account.websites.build.pages.build
    # @account.websites.pages.build
    # website = @account.websites.build
    # website.pages.build    
    
    respond_to do |format|
      format.html {render :layout => 'signup'}
      # format.json { render json: @account }
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])
    # @account.websites[0].pages[0].title = "homepage"
    # @account.websites[0].pages[0].body = ""

    respond_to do |format|
      if @account.save
        format.html { redirect_to admin_login_url, notice: 'Account was successfully created. Please login.' }
        # format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new", layout: "signup" }
        # format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :ok }
    end
  end
end
