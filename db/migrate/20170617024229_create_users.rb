class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :rut
      t.string :nombre
      t.string :apellido
      t.string :email
      t.date   :birth
      t.string :password
      t.string :img

      t.timestamps
    end
  end
end
