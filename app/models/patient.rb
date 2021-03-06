class Patient < ActiveRecord::Base
  has_secure_password
  geocoded_by :zipcode
                      
  after_validation :geocode, if: ->(obj){ 
    obj.zipcode.present? && obj.zipcode_changed? 
  }

  validates :username,        
            presence:   true,
            uniqueness: true

  validates :email, 
            presence:   true,
            format:     /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
            uniqueness: true

  validates :zipcode,
            presence:   true,
            format:     /\A[-0-9 A-z]+\z/

  validates :former_religion, presence: true
  validates :description,     presence: true

  def email=(email)
    write_attribute(:email, email.try(:downcase))
  end

  def available_requests
    3 - (self.patient_therapist_relationships.where(
      patient_id: self.id,
      created_at: 1.month.ago..Date.today).count)
  end

  has_many :patient_therapist_relationships
  has_many :therapists, through: :patient_therapist_relationships
  has_many :conversations, through: :patient_therapist_relationships
end
