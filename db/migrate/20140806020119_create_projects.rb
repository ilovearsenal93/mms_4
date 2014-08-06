class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :shortname
      t.date :start_date
      t.date :end_date
      t.integer :team_id

      t.timestamps
    end
  end
end
