class AddVotesCountToOptions < ActiveRecord::Migration
  def change
    add_column :options, :votes_count, :integer
  end
end
