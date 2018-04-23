class ProgrammingLanguage < ApplicationRecord
  has_many :developer_abilities
  has_many :developers, through: :developer_abilities
end
