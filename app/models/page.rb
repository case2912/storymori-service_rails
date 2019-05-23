class Page < ApplicationRecord
  attribute :name, :string, default: ''
  attribute :text, :string, default: ''
end
