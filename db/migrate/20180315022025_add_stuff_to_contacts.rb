class AddStuffToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :address, :string
    add_column :contacts, :latitude, :float
    add_column :contacts, :longitude, :float
  end
end
