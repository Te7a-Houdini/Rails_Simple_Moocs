class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

  mount_uploader :avatar , AvatarUploader

  validates :name , :presence => true , length: { minimum: 5}
  validates :gender , :presence => true

  validates :birth_date , :presence => true

end
