json.array!(@general_reviews) do |general_review|
  json.extract! general_review, :id, :reviewer_id, :reviewee_id, :rating, :name, :body
  json.url general_review_url(general_review, format: :json)
end
