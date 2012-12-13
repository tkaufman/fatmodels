class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.date :birthdate
    end
  end
end
