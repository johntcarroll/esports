class Api::TeamsController < ApplicationController
  include Crudable
  include RequestHandler

  def initialize
    @model = 'Team'.constantize
  end
end
