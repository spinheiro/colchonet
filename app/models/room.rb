class Room < ActiveRecord::Base
  def complet_name
    "#{title},#{location}"
  end
end
