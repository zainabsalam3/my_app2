json.extract! profile, :id, :user_id, :address, :phone, :created_at, :updated_at
json.url profile_url(profile, format: :json)
