class WebsitesController < ApplicationController
  def index
    @websites = Website.all
    respond_to do |format|
      format.html { render :layout => 'public' }
    end
  end
end
