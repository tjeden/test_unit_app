class Product < ActiveRecord::Base
  validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :description, presence: true
  validates :title, presence: true, length: { minimum: 4 }, uniqueness: true
end
