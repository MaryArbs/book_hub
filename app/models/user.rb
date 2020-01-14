class User < ActiveRecord::Base
    has_many :saves
    has_many :books, through: :saves 
  end