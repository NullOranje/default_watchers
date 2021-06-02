class DefaultWatchersController < ApplicationController
  unloadable

  def index
    @all_active_roles = Role.givable.find(:all)
  end

end
