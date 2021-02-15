class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :author
  # it might be nice to have some validations here
end
