class AddImg < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :image, :string, default: "https://www.placebear.com/500/500"
  end
end
