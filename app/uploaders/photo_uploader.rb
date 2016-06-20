class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [150, 150]
  end

  version :small do
    process resize_to_fit: [250, 250]
  end

  version :large do
    process resize_to_fit: [500, 500]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
