class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :company_email
      t.string :offical_website
      t.string :zip
      t.integer :user_id
      t.timestamps
    end
  end
end
