class Message < ActiveRecord::Base
  belongs_to :website
  
	validates :website_id,
	:presence => true

  validates :to,
  :presence => true,
  :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  # you might have to delete the "from" column from the table,
  # because the email will be coming from the web app email
  # unless you configure it with the website owner's email
  validates :from,
  :presence => true,
  :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :visitor_name,
  :presence => true
  
  validates :visitor_email,
  :presence => true

  validates :content,
  :presence => true

  def abbreviated_created_at
		created_at.strftime("%a %b %d at %I:%M%P")
	end

end
