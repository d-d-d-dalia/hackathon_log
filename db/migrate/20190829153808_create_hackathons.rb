class CreateHackathons < ActiveRecord::Migration[5.2]
  def change
    create_table :hackathons do |t|
      t.string :title
      t.datetime :date
      t.belongs_to :coder

      t.timestamps
    end
  end
end
