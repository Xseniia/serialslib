class Season < ApplicationRecord
  belongs_to :serial
  has_many :episodes, dependent: :destroy
end
