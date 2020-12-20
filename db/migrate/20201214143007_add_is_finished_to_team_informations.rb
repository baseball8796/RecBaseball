class AddIsFinishedToTeamInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :team_informations, :is_finished, :integer
  end
end
