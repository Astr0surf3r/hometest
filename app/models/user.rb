class User < ApplicationRecord
  enum role: [:admin, :job_seeker, :employer]
end
