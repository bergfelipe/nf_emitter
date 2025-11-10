class AddCertificateInstalledToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :certificate_installed, :boolean, default: false, null: false
  end
  
end
