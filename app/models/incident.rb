class Incident < ActiveRecord::Base
  attr_accessible :body, :name, :who

  def Incident.last_incident()
  	Incident.last(1)[0]
  end
end
