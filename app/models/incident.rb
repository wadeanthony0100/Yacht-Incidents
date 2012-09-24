class Incident < ActiveRecord::Base
  attr_accessible :body, :name, :who
end
