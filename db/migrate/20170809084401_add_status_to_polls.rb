class AddStatusToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :status, :integer
  end
end
