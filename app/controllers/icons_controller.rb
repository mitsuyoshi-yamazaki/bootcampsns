require 'rubygems'
require 'RMagick'

class IconsController < ApplicationController

  def create
    file_name = image_params(params).original_filename.downcase
    mime_type = image_params(params).content_type.downcase
    if !!file_name.match(/png|jpeg|jpg|gif/) and mime_type.start_with? 'image/'
      dest_file_name = "#{SecureRandom.uuid}#{File.extname(file_name)}"
      image_path = "#{Rails.root}/public/icons/#{dest_file_name}"
      FileUtils.mv image_params(params).tempfile, image_path
      FileUtils.chmod 0644, image_path
      if px = resize_max_pixel_params(params).to_i
        original = Magick::Image.read(image_path).first
        original.resize(px, px).write(image_path)
      end
      render json: {file_name: dest_file_name} and return
    else
      render json: {errors: ['画像のアップロードに失敗しました']}, status: :bad_request and return
    end
  end

  private

  def image_params params
    params.require(:image)
  end

  def resize_max_pixel_params params
    params.require(:resize_max_pixel)
  end

end
