class Research < ApplicationRecord
    belongs_to :user
    
    validates :number_of_auther, numericality: {less_than: 5}
    validates :year, numericality: {greater_than: 2019}
    validates :title, uniqueness: { case_sensitive: false } 
    validates :title, uniqueness: { scope: [:user_id, :journal, :patent], message: 'This research is allowed to be published in one journal alone and  obtain a patent only once' }
    
    scope :by_patent, -> (patent) {where(Patent: patent)}
end
