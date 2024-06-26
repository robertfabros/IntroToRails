ActiveAdmin.register Park do
  menu label: "Winnipeg's Parks and Open Space"

  permit_params :name, :location_id, :neighbourhood_id, :district_id, :cca

  index title: "Winnipeg's Parks and Open Space" do
    selectable_column
    id_column
    column :name
    column :location
    column :neighbourhood
    column :district
    column :cca
    actions
  end

  filter :name, label: "Park Name"
  filter :location
  filter :neighbourhood
  filter :district
  filter :cca

  form title: "Edit Park Information" do |f|
    f.inputs do
      f.input :name, label: "Park Name"
      f.input :location
      f.input :neighbourhood
      f.input :district
      f.input :cca
    end
    f.actions
  end

  show title: "Park Details" do
    attributes_table do
      row :name
      row :location
      row :neighbourhood
      row :district
      row :cca
    end
  end
end
