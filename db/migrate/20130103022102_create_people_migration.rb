class CreatePeopleMigration < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :type
    end
  end
end
