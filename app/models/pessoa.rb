class Pessoa < ActiveRecord::Base
    has_many :pessoa_sistemas
    has_many :sistemas, :through => :pessoa_sistemas
end
