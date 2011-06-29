class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body

  belongs_to :category

  has_many :comments

  has_one :attachment
end
