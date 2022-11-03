class Book < ApplicationRecord
    belongs_to :user

    validates :title, uniqueness: { scope: :year }
    validates :year, uniqueness: { scope: [:user_id, :title] }
end
