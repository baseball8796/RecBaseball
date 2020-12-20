class AddIsFinishedToTeamInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :team_informations, :is_finished, :boolean, default: false, null: false
  end
end
