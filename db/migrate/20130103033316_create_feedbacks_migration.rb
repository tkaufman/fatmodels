class CreateFeedbacksMigration < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :presentation
      t.references :attendee
      t.integer :rating
      t.string :comment
    end
  end
end
