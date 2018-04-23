class CreateCommunicationAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :communication_abilities do |t|
      t.belongs_to :developer
      t.belongs_to :language
      t.timestamps
    end

    add_index :communication_abilities,
              [:developer_id , :language_id],
              unique: true,
              name: "developer_language_index"

  end
end
