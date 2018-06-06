class ImageUploader < CarrierWave::Uploader::Base
   storage :file

  def store_dir
    "upload/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
