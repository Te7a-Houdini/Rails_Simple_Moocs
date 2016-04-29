ActiveAdmin.register Lecture do


  index do
    selectable_column
    id_column
    column :content
    column :title
    column :image

    actions
  end

  permit_params :title, :content, :user_id,:course_id,:image,:attachement

end