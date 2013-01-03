class CreateAbstractsMigration < ActiveRecord::Migration
  def change
    create_table :abstracts do |t|
      t.string :title
      t.string :description
      t.references :speaker
    end
  end
end
