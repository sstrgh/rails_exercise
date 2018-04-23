class CreateDeveloperAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_abilities do |t|
      t.belongs_to :developer
      t.belongs_to :programming_language
      t.timestamps
    end

    add_index :developer_abilities,
      [:developer_id , :programming_language_id],
      unique: true,
      name: "developer_programming_language_index"

  end
end
