class Caracteristica < ActiveRecord::Base
    has_many :caracteristica_releases
    has_many :release_note, :through => :caracteristica_releases
end
