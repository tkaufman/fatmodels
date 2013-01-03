class CreatePresentationsMigration < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.references :speaker
      t.references :abstract
      t.date :presented_on
    end
  end
end
