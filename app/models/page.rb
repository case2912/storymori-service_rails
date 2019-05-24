class Page < ApplicationRecord
  has_many :children, class_name: 'Page', foreign_key: 'parent_id'
end
