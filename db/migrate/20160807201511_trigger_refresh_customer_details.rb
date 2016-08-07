class TriggerRefreshCustomerDetails < ActiveRecord::Migration
  def change
    %w(customers customers_shipping_addresses customers_billing_addresses addresses).each do |table|
      execute %{
          CREATE OR REPLACE FUNCTION
            refresh_customer_details()
            RETURNS TRIGGER LANGUAGE PLPGSQL
          AS $$
          BEGIN
            REFRESH MATERIALIZED VIEW customer_details;
            RETURN NULL;
          EXCEPTION
            WHEN feature_not_supported THEN
              RETURN NULL;
          END $$;
        }
      end
    end
end
