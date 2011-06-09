class Comment < ActiveRecord::Base
  belongs_to :post

  def name
    body
  end
end
