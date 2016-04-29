class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.string :name
      t.string :hashtag

      t.timestamps null: false
    end
  end
end
