class User < ApplicationRecord
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :username, length: {minimum: 3}, allow_blank: false
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    has_one :profile
    has_many :books
    has_many :researches
end
