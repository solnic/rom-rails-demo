require 'active_model'

class User
  include Equalizer.new(:id, :name)

  include ActiveModel::Model

  attr_accessor :id, :name

  def initialize(attrs = {})
    @id, @name = attrs.values_at(:id, :name)
  end
end
