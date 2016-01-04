class GeneralReview < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"

  validates :rating, presence: true
  validates :reviewer_id, uniqueness: {scope: :reviewee_id}
end
