class ReleaseNote < ActiveRecord::Base
  belongs_to :sistema
  has_many :defeitos
  has_many :observacoes
  has_many :integracoes
  has_many :caracteristica_releases
end
