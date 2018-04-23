class Language < ApplicationRecord
  has_many :communication_abilities
  has_many :developers, through: :communication_abilities
end
