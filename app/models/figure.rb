class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :titles, through: :figure_titles

end
