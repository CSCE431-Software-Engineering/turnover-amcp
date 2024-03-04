# frozen_string_literal: true

class AddDetailsToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    # add_column :admins, :avatar_url, :string
    # Uncomment the next line if you need to add the uid column as well
    # add_column :admins, :uid, :string
    # add_index :admins, :email, unique: true
    # Uncomment the next line if you've added the uid column
    add_index :admins, :uid, unique: true
  end
end
