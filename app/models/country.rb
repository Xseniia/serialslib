# frozen_string_literal: true

class Country < ApplicationRecord # :nodoc:
  has_many :users
  has_many :serials
end
