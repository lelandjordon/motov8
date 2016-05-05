class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author
  # it might be nice to have some validations here
end
