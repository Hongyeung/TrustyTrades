class Job < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :budget, presence: true
  validates :description, presence: true

  has_many :job_taggings, dependent: :destroy
  has_many :tags, through: :job_taggings

  has_many :bids, dependent: :destroy

  has_many :bidders, -> { distinct }, through: :bids, source: :contractor

  belongs_to :user

  def related_users
    job_tag_id_array = self.tags.pluck(:id)
    User.joins(:contractor_taggings).where("contractor_taggings.tag_id IN (?)", job_tag_id_array).uniq
  end
end

# user_tag_ids = []
# @job_tags.each do |tag|
#   user_tag_ids << tag.id
# end
#
# @tags = []
# user_tag_ids.each do |ids|
#   tag = Tag.find_by_id(ids)
#   @tags << tag
# end
#
# @users_associate_tags = []
# @tags.each do |tag|
#   tag.users.each do |user|
#     @users_associate_tags << user
#   end
# end
