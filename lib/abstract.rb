require 'active_record'

class Abstract < ActiveRecord::Base
  belongs_to :speaker
end
