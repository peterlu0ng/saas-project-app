class AddUserIdToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :user_id, :int
  end
end
