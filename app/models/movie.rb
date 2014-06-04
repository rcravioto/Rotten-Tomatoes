class Movie < ActiveRecord::Base

  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.


  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true
  
  #### this ensures that at least one field has been pupulated
  # validates_numericality_of :poster_image_url, allow_nil: true
  # validates_numericality_of :image, allow_nil: true
  # validate :poster_image_url_or_image
  ####


  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  def review_average
    reviews.size == 0 ? reviews.sum(:rating_out_of_ten)/reviews.size : nil
  end

  private
  
  def poster_image_url_or_image
      if !(poster_image_url.blank? ^ image.blank?)
        errors.add(:base, "At least one image source is required to add a Movie. ")
      end
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end
