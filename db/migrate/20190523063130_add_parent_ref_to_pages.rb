class AddParentRefToPages < ActiveRecord::Migration[5.2]
  def change
    add_reference :pages, :parent, foreign_key: true
  end
end
