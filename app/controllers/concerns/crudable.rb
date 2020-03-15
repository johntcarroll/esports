module Crudable
  extend ActiveSupport::Concern

  def index

  end

  def create
  end

  def new
    respond({}, true, 'New route unavailable', 400)
  end

  def edit
    respond({}, true, 'Edit route unavailable', 400)
  end

  def show
    respond(@model.find(params[:id]).attributes, false, nil, 201)
  end

  def update
  end

  def destroy
  end


end
