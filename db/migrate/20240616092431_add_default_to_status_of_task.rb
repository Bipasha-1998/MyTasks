class AddDefaultToStatusOfTask < ActiveRecord::Migration[7.1]
  def up
    change_column :tasks, :status, :string, default: "Backlog"
  end
end
