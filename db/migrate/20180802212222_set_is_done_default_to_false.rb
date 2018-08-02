class SetIsDoneDefaultToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :is_done, :boolean, default: false
  end
end
