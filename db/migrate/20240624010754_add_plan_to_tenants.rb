class AddPlanToTenants < ActiveRecord::Migration[7.1]
  def change
    add_column :tenants, :plan, :string
  end
end
