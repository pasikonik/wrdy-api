# frozen_string_literal: true

module Web
  module Controllers
    module Users
      class Create
        include Web::Action
        include Authentication::Skip
        include JSONAPI::Hanami::Action

        deserializable_resource :user

        def call(params)
          result = AddUser.call(params)

          if result.successful?
            status 201, 'User has been created'
          else
            halt 404, result.errors
          end
        end
      end
    end
  end
end
