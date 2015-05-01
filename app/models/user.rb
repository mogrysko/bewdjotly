class User < ActiveRecord::Base
  has_many :jots
  validates_format_of :email, with: /\A[\w.+\-]+@[\w.+\-]+\.\w+\z/
  validates_presence_of :email
  validates_uniqueness_of :email
  has_attached_file :photo,
  styles: {
  medium: "100x100>"  },
  default_url: "http://www.canadafoot.com/images/profilePlaceholder.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
