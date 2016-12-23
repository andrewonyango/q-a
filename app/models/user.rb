class User < ActiveRecord::Base
  has_many :questions
  # remove :password_digest field as we don't want it manipulable by users
  # add :password and :password_confirmation virtual attributes provided by
  # has_secure_password
  attr_accessible :username, :password, :password_confirmation

  has_secure_password

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { in: 4..12 },
    format: { with: /^[a-z][a-z0-9]*$/,
              message: "can only use lowercase letters and numbers"}

  validates :password, length: { in: 8..16 }
  validates :password_confirmation, length: { in: 8..16 }
end
