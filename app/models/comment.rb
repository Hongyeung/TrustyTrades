class Comment < ActiveRecord::Base
  belongs_to :contractor, class_name: "User"
  belongs_to :bid
end
