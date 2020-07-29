json.extract! transaction, :id, :item_id, :user_id, :rating, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
