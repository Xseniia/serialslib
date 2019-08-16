# frozen_string_literal: true

class Favourite < ApplicationRecord # :nodoc:
  belongs_to :serial
  belongs_to :user
end
