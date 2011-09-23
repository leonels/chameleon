class User < ActiveRecord::Base

  belongs_to :account
  	
	attr_accessible	:email,
									:password,
									:password_confirmation,
									
									:username,
									:first_name,
									:last_name,
									
									:user_state,
									:confirmed_at,

									:invitation_last_sent_at,
									:invitation_last_sent_to
	
	attr_accessor :password
	before_save :encrypt_password
		
	before_create { generate_token(:auth_token) }

	def full_name
		first_name + ' ' + last_name
	end
	
	def abbreviated_name
		first_name + ' ' + last_name[0,1]
	end
		
  # tight validations up
	validates :username,
	:presence => true,
	:uniqueness => true,
  :length => { :minimum => 3, :maximum => 30, :message => 'should have between 3 to 30 characters' }
	
	validates :password,
	:presence => true,
	:length => { :minimum => 6, :maximum => 20, :message => 'should have between 6 to 12 characters' },
	:confirmation => true
  		
  validates :email,
  :presence => true,
  :uniqueness => true,
  :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
	
  def send_password_reset
  	generate_token(:password_reset_token)
  	self.password_reset_sent_at = Time.zone.now
  	save!(:validate => false)
  	Notifier.password_reset(self).deliver
  end
  
  def generate_token(column)
  	begin
  		# when update to ruby 1.9 use the line below instead
  		# self[column] = SecureRandom.urlsafe_base64
  		self[column] = SecureRandom.hex
  	end while User.exists?(column => self[column])
  end
  
	def self.authenticate(username, password)
		user = find_by_username(username)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
	
	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
	
end
