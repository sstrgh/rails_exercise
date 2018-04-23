class Developer < ApplicationRecord
  has_many :developer_abilities
  has_many :programming_languages, through: :developer_abilities

  has_many :communication_abilities
  has_many :languages, through: :communication_abilities
end
