# frozen_string_literal: true

class User < ApplicationRecord
  has_many :attachments

  validates :name, uniqueness: true
  validates :email, uniqueness: true

  enum role: %i[admin job_seeker employer]
end
