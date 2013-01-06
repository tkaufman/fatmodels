class AddStatusToAbstractMigration < ActiveRecord::Migration
  def change
    add_column :abstracts, :status, :string
  end
end
