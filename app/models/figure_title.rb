# this is the join table, each row belongs to a title and a figure
class FigureTitle < ActiveRecord::Base
  belongs_to :figure
  belongs_to :title
end
