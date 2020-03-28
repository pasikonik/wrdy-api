# frozen_string_literal: true

module Web
  module Controllers
    module Users
      class Show
        include Web::Action
        include JSONAPI::Hanami::Action

        def call(params)
          user = repo.find(params[:id])

          self.data = user
          self.fields = { users: %i[email] }
          self.status = 200
        end

        private

        def repo
          @repo ||= UserRepository.new
        end
      end
    end
  end
end
