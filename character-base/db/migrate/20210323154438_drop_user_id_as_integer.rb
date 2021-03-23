class DropUserIdAsInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :user_id
  end
end
