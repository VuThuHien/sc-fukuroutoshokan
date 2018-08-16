json.extract! feedback, :id, :email, :name, :subject, :content, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
