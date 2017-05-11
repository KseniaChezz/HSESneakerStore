class AddLogoToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :logo, :string
  end
end
