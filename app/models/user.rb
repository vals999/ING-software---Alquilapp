class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :dni_nro, uniqueness:  { message: 'ya existe en el sistema' }, presence: { message: 'en blanco' }
  validates :name, presence:  { message: 'en blanco' }
  validates :last_name, presence:  { message: 'en blanco' }
  validates :license, presence: { message: 'en blanco' }, if: :usuario? 
  #validates :dni, presence:  { message: 'en blanco' },if: :usuario? 
  validates :birthdate, presence:  { message: 'en blanco' },if: :usuario? 
  validates :phone, uniqueness: { message: 'ya existe en el sistema' }, presence:  { message: 'en blanco' },if: :usuario? 
  validate :acceptable_image,if: :usuario? 
  validate :acceptable_image2,if: :usuario? 
  validates :vencimiento_licencia, presence:  { message: 'en blanco' },if: :usuario?
  #validates :email, uniqueness: { message: 'ya existe en el sistema' }, presence:  { message: 'en blanco' }
  #validates :password, uniqueness: { message: 'ya existe en el sistema' }, presence:  { message: 'en blanco' }
  has_one_attached :license
  has_one_attached :dni
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:usuario, :supervisor, :administrador]
  
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role  
    self.role ||= :usuario
  end

  def usuario
    self.role == "usuario"
  end
  #validacion para que las fotos que se suban sean JPEG O PNG
  def acceptable_image
    acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
    unless acceptable_types.include?(license.content_type)
      errors.add(:license, "Foto debe ser una imagen JPEG, JPG o PNG")
    end
  end
  def acceptable_image2
    acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
    unless acceptable_types.include?(dni.content_type)
      errors.add(:dni, "Foto debe ser una imagen JPEG, JPG o PNG")
    end
  end
end
