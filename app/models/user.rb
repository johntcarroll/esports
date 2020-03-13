class User < ApplicationRecord
  has_many :teams, dependent: :destroy
  before_save :generate_token

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64
  end

end
