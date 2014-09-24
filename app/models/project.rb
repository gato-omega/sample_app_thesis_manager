class Project
  include Mongoid::Document
  include Mongoid::Search

  field :name, type: String
  field :description, type: String

  search_in :name, :description

  belongs_to :user

end
