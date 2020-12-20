class RemoveIsFinishedFromTeamInformations < ActiveRecord::Migration[5.2]
  def change
    remove_column :team_informations, :is_finished, :integer
  end
end
