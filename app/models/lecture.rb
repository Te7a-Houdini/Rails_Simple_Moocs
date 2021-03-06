class Lecture < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  has_many :comments

  validates :title , :presence => true , length: { minimum: 3 , maximum: 30}
  validates :content , :presence => true
  validates :course_id , :presence  => true
  mount_uploader :image, LectureImagesUploader
  mount_uploader :attachement, LectureAttachementsUploader

  acts_as_votable
end
