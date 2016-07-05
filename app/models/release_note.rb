class ReleaseNote < ActiveRecord::Base
  belongs_to :sistema
  has_many :defeitos
end
