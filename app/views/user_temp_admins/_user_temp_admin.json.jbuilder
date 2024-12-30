json.extract! user_temp_admin, :id, :name, :last_name, :dni_nro, :email, :password, :password_confirmation, :created_at, :updated_at
json.url user_temp_admin_url(user_temp_admin, format: :json)
