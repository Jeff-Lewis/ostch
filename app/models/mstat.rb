class Mstat < ActiveRecord::Base
    belongs_to :mobject
    belongs_to :company
    belongs_to :user
end
