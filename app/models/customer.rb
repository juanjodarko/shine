class Customer < ActiveRecord::Base
  has_many :customers_shipping_addresses
  has_many :customers_billing_addresses
end
