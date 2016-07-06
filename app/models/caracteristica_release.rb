class CaracteristicaRelease < ActiveRecord::Base
  belongs_to :caracteristica
  belongs_to :release_note
end
