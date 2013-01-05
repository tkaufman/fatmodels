class EveryoneBelongsToConferenceMigration < ActiveRecord::Migration
  def change
    add_column :abstracts, :conference_id, :integer
    add_column :presentations, :conference_id, :integer
    add_column :feedbacks, :conference_id, :integer, :after => :presentation_id
  end
end
