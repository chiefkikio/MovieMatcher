class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :file
      t.integer :actor_id

      t.timestamps
    end
  end
end
