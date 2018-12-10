class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, authentication_keys: [:login],
         omniauth_providers: [:instagram]

  attr_accessor :login
  has_many :socials, :dependent => :destroy

  def has_connection_with(provider)
    auth = self.socials.where(provider: provider).first
    if auth.present?
      auth.token.present?
    else
      false
    end
  end

  def disconnect(social)
    if social == 'instagram'
      key = 'Instagram'
    else
      key = social.capitalize
    end
    auth = self.socials.where(provider: key).first
    auth.update_attributes(token: nil, secret: nil)
  end


  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end
end
