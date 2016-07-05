class PessoaSistema < ActiveRecord::Base
  belongs_to :sistema
  belongs_to :pessoa
end
