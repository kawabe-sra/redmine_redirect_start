require_dependency 'welcome_controller'
require File.expand_path('../lib/redmine_redirect_start_patch', __FILE__)

Redmine::Plugin.register :redmine_redirect_start do
  name 'Redmine Redirect Start Page plugin'
  author 'Y. kawabe'
  description 'This redmine plugin redirect redmine start page.'
  author_url 'http://www.projdepot.jp/'
  version '0.3.0'

  settings :partial => 'settings/redmine_redirect_start_settings',
    :default => { 'start' => '' }
end

WelcomeController.send(:include, RedmineRedirectStartPatch)
