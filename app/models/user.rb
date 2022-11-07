class User < ApplicationRecord
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :username, length: {minimum: 3}, allow_blank: false
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :identifier, presence: true
    validates :password, presence: true

    scope :by_book_year, -> (year) {joins(:books).where(books: {Year: year})}
    scope :by_research_journal, -> (journal) {joins(:researches).where(researches: {Journal: journal})}


    has_one :profile
    has_many :books
    has_many :researches

    def self.generate_number
        SecureRandom.hex(10)
    end
    def generate_number_from_user
        username + SecureRandom.hex(10)
        end

    before_validation :generate_id, on: :create

    private

    def generate_id
        self.identifier = "ABC-#{Date.today.year}-#{SecureRandom.hex(7)}"
    end

    before_validation :security_number, on: :create

    private
    def security_number
        self.password = "#{(0...4).map { ('a'..'z').to_a[rand(26)] }.join}#{SecureRandom.random_number(1_000_000)}"
    end




end
   
