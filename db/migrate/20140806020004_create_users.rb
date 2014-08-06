class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.string :position
      t.integer :admin, default: 0
      t.integer :team_id 
      t.string :password_digest
      t.timestamps
    end
  end
end
