class CambiandoCampo < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :string, :img
  end
end
