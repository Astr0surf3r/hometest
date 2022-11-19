json.extract! attachment, :id, :title, :user_id, :type_doc, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
