ActiveAdmin.register Brand do
  permit_params :name, :description, :category_id, :image

  remove_filter :image_attachment, :image_blob
  config.filters = false

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
