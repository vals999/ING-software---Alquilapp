json.extract! user_temp_sup, :id, :name, :last_name, :dni_nro, :email, :password, :created_at, :updated_at
json.url user_temp_sup_url(user_temp_sup, format: :json)
