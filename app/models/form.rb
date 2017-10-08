class Form < ApplicationRecord
  before_save :normalize_fields
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_MOBILE_REGEX = /^[0-9]{10}$/

  validates_presence_of :full_name, :occupation, :title, :nationality
  validates :email, uniqueness: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, allow_nil: true
  validates :mobile, format: { with: VALID_MOBILE_REGEX, multiline: true }
  

  private

  def normalize_fields
    self.full_name = full_name.titleize unless full_name.blank?
    self.email = email.downcase unless email.blank?
    self.occupation = occupation.titleize unless occupation.blank?
  end
end
