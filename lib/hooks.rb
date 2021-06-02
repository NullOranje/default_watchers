module DefaultWatchers
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_after_save(context = {})
      add_watchers(context)
    end

    def add_watchers(context)
      settings ||= Setting.plugin_default_watchers
      default_watchers = settings['default_watchers'].select { |watcher| !watcher.empty? }
      @issue = Issue.find context[:issue][:id]

      if context[:params][:issue]
        default_watchers.each do |watcher_role|
          users = @issue.project.principals_by_role[Role.find(watcher_role)]
          unless users.blank?
            users.each do |user|
              new_watcher(user)
            end
          end
        end
      end
    end

    def new_watcher(user)
      unless user.is_a?(Group)
        Watcher.create(:watchable => @issue, :user => user)
      end
    end

    private :new_watcher
  end
end
