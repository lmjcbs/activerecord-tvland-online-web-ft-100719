class Show < ActiveRecord::Base
  
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list
    list = []
    char = Character.find_by('show_id = ?', self.id)
    actor = Actor.find_by('id = ?', char.actor_id)
    list << actor.full_name
  end

  def build_network(options)
    self.network = Network.create(options)
  end

end