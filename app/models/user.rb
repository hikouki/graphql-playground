class User < ApplicationRecord
  validates :age, numericality: { less_than: 100 }
end
