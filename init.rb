require_dependency 'hooks'

Redmine::Plugin.register :default_watchers do
  name 'Default Watchers plugin'
  author 'Nick McKinney'
  description 'Automatically add users as watchers to tickets based on role(s).'
  version '0.1.1'
  url 'http://github.com/NullOranje/default_watchers'
  author_url 'http://github.com/NullOranje/'
  settings default: {'default_watchers' => []}, partial: 'settings/default_watchers'
end
