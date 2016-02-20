class Product < ActiveRecord::Base
	belongs_to :website
	belongs_to :category
	validates :website, presence: true
end
