class CreateCustomersBillingAddresses < ActiveRecord::Migration
  def change
   create_table :customers_shipping_addresses do |t| 
      t.references :customer, null: false 
      t.references :address, null: false 
      t.boolean :primary, null: false, default: false 
    end 
  end
end
