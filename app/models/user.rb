class User < ActiveRecord::Base

  has_secure_password

  after_initialize :default_value

  has_many :general_reviews, foreign_key: :reviewer_id
  has_many :reviewees, through: :general_reviews, source: :reviewee

  has_many :inverse_general_reviews, foreign_key: :reviewee_id, class_name: "GeneralReview"
  has_many :reviewers, through: :inverse_general_reviews, source: :reviewer

  has_many :contractor_taggings, dependent: :destroy
  has_many :tags, through: :contractor_taggings

  has_many :jobs, dependent: :destroy

  has_one :bid, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true

  def self.search(search)

    tag = Tag.find_by_kind search
    if tag.present?
      where(["company_name ILIKE ?", "%#{search}%"]) + tag.users
    else
      where(["company_name ILIKE ?", "%#{search}%"])
    end
  end

  private
    def default_value
      self.contractor ||= false
    end

end
