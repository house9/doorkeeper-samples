class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :owner_id, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
