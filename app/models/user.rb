class User < ActiveRecord::Base
  has_many :jots
  validates_format_of :email, with: /\A[\w.+\-]+@[\w.+\-]+\.\w+\z/
  validates_presence_of :email
  validates_uniqueness_of :email
end
