# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, # :omniauthable
         :jwt_authenticatable, jwt_revocation_strategy: self

  attribute :jwt_token, :string
end
