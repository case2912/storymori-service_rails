class Story < ApplicationRecord
  attribute :title, :string, default: ''
  attribute :summary, :string, default: ''
  has_many :pages
end
