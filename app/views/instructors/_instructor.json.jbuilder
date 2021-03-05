json.extract! instructor, :id, :instructor_id, :email, :first, :last, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
