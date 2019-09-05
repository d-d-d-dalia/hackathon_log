class CoderSerializer < ActiveModel::Serializer
  attributes :id, :name, :language
  has_many :hackathons
end