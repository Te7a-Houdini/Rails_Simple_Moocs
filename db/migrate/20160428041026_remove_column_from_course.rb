class RemoveColumnFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses , :user_id_id

    add_foreign_key :courses , :users , column: :user_id
  end
end
