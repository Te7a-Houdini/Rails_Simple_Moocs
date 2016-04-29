ActiveAdmin.register User do


  index do
    selectable_column
    id_column
    column :email
    column :name
    column :gender
    column :is_instructor
    column :birth_date
    actions
  end
  permit_params :email, :name, :gender,:avatar,:is_instructor,:birth_date,:password

end