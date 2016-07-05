class Integracao < ActiveRecord::Base
  belongs_to :tipo_integracao
  belongs_to :release_note
end
