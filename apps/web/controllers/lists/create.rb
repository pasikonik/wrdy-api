# frozen_string_literal: true

module Web
  module Controllers
    module Lists
      class Create
        include Web::Action
        include JSONAPI::Hanami::Action

        deserializable_resource :list

        def call(params)
          result = AddList.new.call(params, current_user.id)

          if result.successful?
            status 201, 'List has been created'
          else
            half 404, result.errors
          end
        end
      end
    end
  end
end
