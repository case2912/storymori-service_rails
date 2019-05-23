class AddTextToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :text, :string
  end
end
