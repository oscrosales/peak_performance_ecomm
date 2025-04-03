ActiveAdmin.register Product do
  permit_params :name, :price, :description, :stock_quantity, :brand_id

  remove_filter :image_attachment, :image_blob
end
