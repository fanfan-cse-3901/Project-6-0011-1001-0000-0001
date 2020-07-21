json.extract! item, :id, :seller_id, :title, :quality, :price, :color, :location, :category, :sub_category, :description, :picture, :created_at, :updated_at
json.url item_url(item, format: :json)
