class Attachment < ApplicationRecord
  
  has_one_attached :doc
  
  belongs_to :user
  
  enum type_doc: [:resume, :cover_letter, :photo]

end
