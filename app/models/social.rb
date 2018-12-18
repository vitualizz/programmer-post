class Social < ApplicationRecord
  validates :provider, :uid, :user_id, presence: true
  def connect?
    self.token.present?
  end
end
