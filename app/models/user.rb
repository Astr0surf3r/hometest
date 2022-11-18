class User < ApplicationRecord
  
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  
  enum role: [:admin, :job_seeker, :employer]
end
