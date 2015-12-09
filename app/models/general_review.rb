class GeneralReview < ActiveRecord::Base

  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"

  validates :rating, presence: true
  

end
