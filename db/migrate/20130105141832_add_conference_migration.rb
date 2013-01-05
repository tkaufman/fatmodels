class AddConferenceMigration < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.date :begins
      t.date :ends
      t.text :location
    end
  end
end
