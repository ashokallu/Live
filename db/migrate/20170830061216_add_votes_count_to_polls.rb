class AddVotesCountToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :votes_count, :integer
  end
end
