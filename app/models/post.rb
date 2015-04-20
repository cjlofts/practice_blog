class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users_who_liked, through: :likes, source: :user

  has_many :stars, dependent: :destroy
  has_many :users_who_starred, through: :stars, source: :user

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true

  def user # this would be a work around if not all posts were written by a 'user'
    if user_id
      User.find_by(id: user_id)
    else
      User.new(first_name: "No user available", last_name: "")
    end
  end

  scope :most_recent_first, lambda { order("updated_at DESC") }

end
