# frozen_string_literal: true

class Attachment < ApplicationRecord
  has_one_attached :doc

  belongs_to :user

  enum type_doc: %i[resume cover_letter photo]
end
