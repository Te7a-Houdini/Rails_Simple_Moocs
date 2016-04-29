ActiveAdmin.register Course do


  index do
    selectable_column
    id_column
    column :title

    actions
  end
  permit_params :title, :content, :user_id,:image

end