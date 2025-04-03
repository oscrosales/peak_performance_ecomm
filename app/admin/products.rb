ActiveAdmin.register Product do
  permit_params :name, :price, :description, :stock_quantity, :brand_id, :image

  remove_filter :image_attachment, :image_blob

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
