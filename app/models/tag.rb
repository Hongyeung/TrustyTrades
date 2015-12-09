class Tag < ActiveRecord::Base

  has_many :contractor_taggings, dependent: :destroy
  has_many :users, through: :contractor_taggings

  has_many :job_taggings, dependent: :destroy
  has_many :jobs, through: :job_taggings

  validates :kind, presence: true, uniqueness: true


end
