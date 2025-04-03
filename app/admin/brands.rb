ActiveAdmin.register Brand do
  permit_params :name, :description, :category_id

  remove_filter :image_attachment, :image_blob
end
