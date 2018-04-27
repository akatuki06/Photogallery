class User < ApplicationRecord
	has_many :works
	has_many :orders
	has_one :artist
	has_one :address
	has_many :clip_works, dependent: :destroy
	has_many :works, through: :clip_works
	has_many :clip_artists, dependent: :destroy
	has_many :artists, through: :clip_artists
	has_many :clip_exhibitions, dependent: :destroy
	has_many :exhibitions, through: :clip_exhibitions

	validates :name, presence: true

	attachment :image

	# 論理削除
	def active_for_authentication?
		super && self.is_deleted == false
	end

	def inactive_message
		self.is_deleted == false ? super : :deleted_account
	end


  # devise関連
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


	 def self.find_for_google_oauth2(auth)
	 	user = User.where(email: auth.info.email).first

	 	unless user
	 		user = User.create(name:     auth.info.name,
	 			provider: auth.provider,
	 			uid:      auth.uid,
	 			email:    auth.info.email,
	 			token:    auth.credentials.token,
	 			password: Devise.friendly_token[0, 20])
	 	end
	 	user
	 end

	 def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
	 	user = User.where(email: auth.info.email).first

	 	unless user
	 		user = User.create(name:     auth.extra.raw_info.name,
	 			provider: auth.provider,
	 			uid:      auth.uid,
	 			email:    auth.info.email,
	 			password: Devise.friendly_token[0,20]
	 			)
	 	end
	 	user
	 end

	 # allow users to update their accounts without passwords
  def update_without_current_password(params, *options)
    params.delete(:current_password)
 
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
 
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
