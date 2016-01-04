class Bid < ActiveRecord::Base
  belongs_to :job
  belongs_to :contractor, class_name: "User", foreign_key: 'user_id'

  has_many :comments
end
