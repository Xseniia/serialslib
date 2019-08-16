# frozen_string_literal: true

class SerialActor < ApplicationRecord
  belongs_to :serial
  belongs_to :actor
end
