class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 200 }
	validates :body,  presence: true, length: { maximum: 2000 }
	

end
