# Encodes and decodes API token with defined secret key
class JwtService
  # Encodes payload using HMAC-SHA-256 algorithm with secret_key_base defined in
  # config/secrets.yml
  #
  # ===== Attributes
  # * +payload+ - JWT payload in hash form
  #
  # ===== Examples
  # JwtService.encode({ userId: '1' })
  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # Decodes JWT using HMAC-SHA-256 algorithm with secret_key_base defined in
  # config/secrets.yml
  #
  # ===== Attributes
  # * +token+ - Token which is to be decoded
  #
  # ===== Examples
  # JwtService.decode('eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoibmFtZSJ9
  # .ARNj6WIbqW9kVnIKK83KBJvqC2o9n-wLBsqHCuzcLew')
  def self.decode(token)
    body, = JWT.decode(token, Rails.application.secrets.secret_key_base,
                       algorithm: 'HS256')
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature
    nil
  end
end
