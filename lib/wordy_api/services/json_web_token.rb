# frozen_string_literal: true

class JsonWebToken
  DEFAULT_EXPIRE_TIME = 86_400 # 24 hours

  class << self
    def encode(payload, exp = Time.new + DEFAULT_EXPIRE_TIME)
      payload[:exp] = exp.to_i
      JWT.encode(payload, ENV['WEB_SESSIONS_SECRET'])
    end

    def decode(token)
      JWT.decode(token, ENV['WEB_SESSIONS_SECRET']).first
    rescue StandardError
      nil
    end
  end
end
