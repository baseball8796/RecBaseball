class CreateTeamInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :team_informations do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :region
      t.string :recruiting_people
      t.string :content

      t.timestamps
    end
  end
end
