class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.string "plaintext", null: false
      t.string "key1", null: false
      t.string "output", null: false
      t.string "key2"
      t.string "output2"
      t.datetime "created_at", null: false
    end
  end
end
