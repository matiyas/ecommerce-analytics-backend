# frozen_string_literal: true

# TODO write documentation to User model
class User < ApplicationRecord
  has_secure_password
end
