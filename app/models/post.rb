class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 200 }
	validates :body, presence: true, length: { maximum: 2000 }
	validates :user_id, presence: true, uniqueness: true
	belongs_to :user
end
