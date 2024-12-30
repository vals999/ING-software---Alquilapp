class Car < ApplicationRecord
    validates :patent, uniqueness:  { message: 'ya existe en el sistema' }, presence: { message: 'en blanco' }
    validates :brand, presence: { message: 'en blanco' }
    validates :model_car, presence: { message: 'en blanco' }
    validates :seats, presence: { message: 'en blanco' }
    validates :transmision, presence: { message: 'en blanco' }
    validates :fuel, presence: { message: 'en blanco' }
    validates :color, presence: { message: 'en blanco' }
    validates :car_number, uniqueness:  { message: 'ya existe en el sistema' }, presence: { message: 'en blanco' } 
    validates :year_model, presence: { message: 'en blanco' }

end
