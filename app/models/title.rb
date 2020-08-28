# a title has many figures through figure titles
# therefore, a title also has many figure titles
class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles
end
