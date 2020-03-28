# frozen_string_literal: true

module Web
  module Controllers
    module Users
      class Show
        include Web::Action
        include Authentication::Skip


        def call(params)
          user = repo.find(params[:id])
        end

        private

        def repo
          @repo ||= UserRepository.new
        end

        def validator(attributes)
          UserValidator.new attributes
        end
      end
    end
  end
end
