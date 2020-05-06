class Pet < ApplicationRecord
  belongs_to :shelters
  validates_presence_of :name
end
