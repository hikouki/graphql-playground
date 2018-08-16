module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: 'An example field added by the generator'
    def test_field
      'Hello World!'
    end

    field :current_user, UserType, null: false
    def current_user
      context[:current_user]
    end

    field :users, [UserType], null: false
    def users
      User.all
    end

    field :user, UserType, null: true do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end
  end
end
