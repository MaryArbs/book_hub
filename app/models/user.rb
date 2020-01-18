class User < ActiveRecord::Base
    has_many :saves
    has_many :books, through: :saves
    has_secure_password
  end