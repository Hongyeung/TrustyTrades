class User < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  mount_uploader :avatar, AvatarUploader
  mount_uploader :image_one, ImageUploader
  mount_uploader :image_two, ImageUploader
  mount_uploader :image_three, ImageUploader

  has_secure_password

  after_initialize :default_value

  has_many :general_reviews, foreign_key: :reviewer_id
  has_many :reviewees, through: :general_reviews, source: :reviewee

  has_many :inverse_general_reviews, foreign_key: :reviewee_id, class_name: "GeneralReview"
  has_many :reviewers, through: :inverse_general_reviews, source: :reviewer

  has_many :contractor_taggings, dependent: :destroy
  has_many :tags, through: :contractor_taggings

  has_many :jobs, dependent: :destroy

  has_many :bids, dependent: :destroy

  has_many :comments, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :address, presence: true

  def self.search(search)
    tag = Tag.find_by_kind search
    if tag.present?
      where(["company_name ILIKE ?", "%#{search}%"]) + tag.users
    else
      where(["company_name ILIKE ?", "%#{search}%"])
    end
  end

  def is_a_contractor?
    self.contractor
  end

  def related_jobs
    user_tag_id_array = self.tags.pluck(:id)
    Job.joins(:job_taggings).where("job_taggings.tag_id IN (?)", user_tag_id_array).uniq
  end

  def average_general_reviews
     if inverse_general_reviews.average(:rating).present?
       self.inverse_general_reviews.average(:rating)
     else
       0
     end
  end

  def has_bid_for_job?(job)
    bids.where(job: job).exists?
  end

  private
    def default_value
      self.contractor ||= false
    end

end
