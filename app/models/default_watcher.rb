class DefaultWatchers < ActiveRecord::Base
  belongs_to :role
  belongs_to :watcher, :class_name => "Role"
end
