class Pokemon < ApplicationRecord
  has_and_belongs_to_many :types
  validates :name, length: { maximum: 255 }
  validates :poke_id, :name, { presence: true, uniqueness: true }
  validates :poke_id, :base_experience, :height, :weight, :order, numericality: { greater_tnah_or_equal_to: 0 }
  validates_associated :types
end
