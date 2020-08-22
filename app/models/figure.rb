# a figure has many titles through figure_titles
# therefore, a figure also has many figure_titles
# a figure also has many landmarks (a landmark belongs to a figure)
class Figure < ActiveRecord::Base
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  has_many :landmarks
end
