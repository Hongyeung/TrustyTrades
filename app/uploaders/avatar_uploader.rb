

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :small do
    process :resize_to_fit => [100, 100]
  end

  version :large do
    process :resize_to_fill => [300, 300]
  end



end
