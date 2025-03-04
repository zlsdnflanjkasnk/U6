class Customer < ApplicationRecord
  has_one_attached :image
  validates :full_name, presence: true
  validates :phone_number, presence: true
  # Allow Ransack to search these fields
  def self.ransackable_attributes(auth_object = nil)
    %w[full_name phone_number email notes created_at updated_at]
  end

  # Allowlist ActiveStorage associations
  def self.ransackable_associations(auth_object = nil)
    ['image_attachment', 'image_blob']
  end
end
