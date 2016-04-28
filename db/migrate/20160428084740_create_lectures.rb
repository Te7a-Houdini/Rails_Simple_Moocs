class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.text :content
      t.string :attachement
      t.string :title
      t.string :image
      t.references :course
      t.references :user

      t.timestamps null: false
    end
  end
end
