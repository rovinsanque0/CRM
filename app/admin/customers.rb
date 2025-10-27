ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :phone_number, :email, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # 

  permit_params :full_name, :phone_number, :email, :notes, :avatar

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :notes
    column :avatar do |c|
      if c.avatar.attached?
        image_tag url_for(c.avatar.variant(resize_to_limit: [64, 64]))
      end
    end
    actions
  end

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :avatar, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :avatar do |c|
        if c.avatar.attached?
          image_tag url_for(c.avatar.variant(resize_to_limit: [200, 200]))
        end
      end
    end
  end
  
end
