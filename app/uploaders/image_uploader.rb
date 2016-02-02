

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :medium do
    process :resize_to_fill => [255, 195]
  end
  # end
  version :large do
    process :resize_to_fill => [260, 200]
  end
end
