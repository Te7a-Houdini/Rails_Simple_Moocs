class AddAvatarDateOfBirthGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string, :default => '/images/users/default.jpeg'

    add_column :users , :birth_date , :date

    add_column :users , :gender , :string

    add_column :users , :is_instructor , :boolean

  end
end
