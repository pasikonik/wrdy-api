class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base

  class << self
    def encode(payload)
      JWT.encode(payload, SECRET_KEY)
    end

    def decode(payload)
      JWT.decode(payload, SECRET_KEY).first
    rescue StandardError
      nil
    end
  end
end
