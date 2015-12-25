class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.string :stamp_id

      t.timestamps null: false
    end
  end
end
