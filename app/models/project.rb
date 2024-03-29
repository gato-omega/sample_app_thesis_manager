class Project
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String

  validates_presence_of :name, :description

  search_in :name, :description, user: :email

  belongs_to :user

end
