class User < ActiveRecord::Base
  include ApplicationHelper
  include UsersHelper
  has_and_belongs_to_many :matches
  has_and_belongs_to_many :leagues
  has_one :player
  #belongs_to :season
  #belongs_to :player


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def wins
  end

  def get_name
    self.first_name + ' ' + self.last_name
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  # previous working method wihout authorizations table
  def self.from_omniauth(auth)
    where(:provider => auth.provider, :uid => auth.uid.to_s).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name.gsub(" ","").downcase
      user.avatar = auth.info.image
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at
      auth.provider == "soundcloud" ?  user.save(:validate => false) :  user.save
    end
  end

  def fetch_details
    self.send("fetch_details_from_#{self.provider.downcase}") if self.provider
  end

  def fetch_details_from_facebook
    graph = Koala::Facebook::API.new(self.oauth_token)
    facebook_data = graph.get_object('me')
    self.first_name = facebook_data['first_name']
    self.last_name = facebook_data['last_name']
    self.uid = facebook_data['user_id']
    self.email = facebook_data['email']
    self.save
  end

end
