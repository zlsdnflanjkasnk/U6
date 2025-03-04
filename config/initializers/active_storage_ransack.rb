# Allow searchable ActiveStorage attributes for Ransack
Rails.application.config.to_prepare do
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      %w[id name record_type record_id blob_id created_at]
    end

    def self.ransackable_associations(auth_object = nil)
      %w[blob]
    end
  end

  ActiveStorage::Blob.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      %w[id filename content_type metadata byte_size checksum created_at]
    end
  end
end
