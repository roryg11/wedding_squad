class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :squad_id
      t.string :type

      t.timestamps null: false
    end
  end
end
