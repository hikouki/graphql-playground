module Mutations
  class CreateUser < GraphQL::Schema::RelayClassicMutation
    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    argument :name, String, required: true
    argument :age, Integer, required: true
    argument :gender, String, required: true

    def resolve(name:, age:, gender:)
      user = User.new(name: name, age: age, gender: gender)
      if user.save
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end
