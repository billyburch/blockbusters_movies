class Blockbuster < ApplicationRecord
  has_many :movies

  # def self.newest_first
  #   Blockbuster.order(created_at: :desc)
  # end

end