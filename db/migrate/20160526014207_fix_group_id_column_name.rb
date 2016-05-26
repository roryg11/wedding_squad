class FixGroupIdColumnName < ActiveRecord::Migration
  def change
    rename_column :invites, :user_group_id, :squad_id
  end
end
