class User < ApplicationRecord
  #hash password
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  has_many :jobs

 #make the default value for role jobseeker
  attribute :role, :string, default: 'jobSeeker'

end