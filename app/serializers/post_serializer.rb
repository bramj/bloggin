class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :status, :release_at, :released_at, :created_at, :updated_at
end
