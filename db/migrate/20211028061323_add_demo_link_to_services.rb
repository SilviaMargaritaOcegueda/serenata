class AddDemoLinkToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :demo_link, :string
  end
end
