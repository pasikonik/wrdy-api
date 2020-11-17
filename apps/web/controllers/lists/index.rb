# frozen_string_literal: true

module Web
  module Controllers
    module Lists
      class Index
        include Web::Action
        include JSONAPI::Hanami::Action

        def call(_params)
          lists = repo.lists_by_owner(current_user)

          self.data = lists
          self.fields = { lists: %i[name] }
          self.status = 200
        end

        private

        def repo
          @repo ||= ListRepository.new
        end
      end
    end
  end
end
