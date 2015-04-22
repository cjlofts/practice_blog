class Category < ActiveRecord::Base
  belongs_to :user

  has_many :categorizations, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
