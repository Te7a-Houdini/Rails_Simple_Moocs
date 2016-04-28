class Course < ActiveRecord::Base

  belongs_to :user
  has_many :lectures
  validates :title , :presence => true , length: { minimum: 3 , maximum: 30}
  mount_uploader :image, CourseUploader
end
