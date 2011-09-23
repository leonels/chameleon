module PagesHelper

  def theme_asset_path()
    website = Website.find_by_subdomain(request.subdomain)
    if website.layout_name.nil?
      '/assets/'
    else
      '/assets/' + website.layout_name + '/'
    end
  end

end
