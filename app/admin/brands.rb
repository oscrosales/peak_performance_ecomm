ActiveAdmin.register Brand do
  permit_params :name, :description, :category_id
end
