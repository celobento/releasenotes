class Sistema < ActiveRecord::Base
    has_one  :release_notes
    has_many :pessoa_sistemas
    has_many :pessoas, :through => :pessoa_sistemas
end
