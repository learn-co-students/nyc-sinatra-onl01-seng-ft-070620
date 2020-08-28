# a landmark belongs to a figure
class Landmark < ActiveRecord::Base
  belongs_to :figure
end
