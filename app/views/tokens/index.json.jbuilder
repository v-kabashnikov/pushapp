json.array!(@tokens) do |token|
  json.extract! token, :id, :user_token
  json.url token_url(token, format: :json)
end
