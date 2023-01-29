class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base

  class << self
    def encode(payload)
      JWT.encode(payload, SECRET_KEY, 'HS512')
    end

    def decode(payload)
      JWT.decode(payload, SECRET_KEY, true, { algorithm: 'HS512' }).first
    rescue StandardError
      nil
    end
  end
end
