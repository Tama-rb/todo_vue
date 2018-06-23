class Api::TodoSerializer < ActiveModel::Serializer
  attributes :id, :content
end
