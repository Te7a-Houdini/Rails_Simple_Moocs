class RemoveColumnFromCourse < ActiveRecord::Migration
  def change


    add_foreign_key :courses , :users , column: :user_id
  end
end
