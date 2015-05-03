class User < ActiveRecord::Base
  has_many :jots
  has_many :likes, through: :jots
  validates_format_of :email, with: /\A[\w.+\-]+@[\w.+\-]+\.\w+\z/
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_length_of :username, maximum: 16
  has_attached_file :photo,
  styles: {
  medium: "100x100>"  },
  default_url: "http://www.canadafoot.com/images/profilePlaceholder.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE  follower_id = :user_id"
    Jot.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end
end
