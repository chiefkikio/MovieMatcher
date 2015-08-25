class ChangeIdFormatInActors < ActiveRecord::Migration
  def change
  	change_column :actors, :actor_id, :integer
  end
end
