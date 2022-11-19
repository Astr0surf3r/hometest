class User < ApplicationRecord
  
  has_many :attachments

  validates :name, uniqueness: true
  validates :email, uniqueness: true
  
  enum role: [:admin, :job_seeker, :employer]
end
