class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.integer :user_id
      t.integer :skill_id
      t.integer :level
      t.integer :usedyear

      t.timestamps
    end

      add_index :user_skills, :user_id
      add_index :user_skills, :skill_id
      add_index :user_skills, [:user_id, :skill_id], unique: true
  end
end
