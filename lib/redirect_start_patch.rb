module RedmineRedirectStartPatch

    def self.included(base)
        base.send(:include, RediretWelcomeController)
        base.class_eval do
            unloadable
            alias_method_chain :index, :redirect_start
        end
    end

    module RediretWelcomeController
        def index_with_redirect_start()
            start = Setting.plugin_redmine_redirect_start['start']
            start = start[1..-1] if start.start_with? "/"
            return index_without_redirect_start if start.empty?

            base = (ActionController::Base.relative_url_root || "").chomp("/")
            redirect_to "#{base}/#{start}", :status => 302
        end
    end
end
