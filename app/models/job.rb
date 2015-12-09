class Job < ActiveRecord::Base

  validates :name, presence: true
  # validates :budget, presence: true
  validates :description, presence: true

  has_many :job_taggings, dependent: :destroy
  has_many :tags, through: :job_taggings

  has_many :bids, dependent: :destroy

  belongs_to :user

end
