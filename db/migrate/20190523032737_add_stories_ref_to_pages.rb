class AddStoriesRefToPages < ActiveRecord::Migration[5.2]
  def change
    add_reference :pages, :story, foreign_key: true
  end
end
