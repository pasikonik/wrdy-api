# frozen_string_literal: true

module Web
  module Controllers
    module Sessions
      class Me
        include Web::Action

        def call
          'yes'
        end
      end
    end
  end
end
