require 'redmine'

Redmine::Plugin.register :redmine_importer do
  name 'Issue Importer'
  author 'Martin Liu'
  description 'Issue import plugin for Redmine.'
  version '0.3.1.1'

  project_module :importer do
    permission :import, :importer => :index
    permission :match, :importer => :match
   
  end
  menu :project_menu, :importer, { :controller => 'importer', :action => 'index' }, :caption => :label_import, :before => :settings, :param => :project_id

  ActionController::Routing::Routes.draw do |map|
    map.connect 'projects/:project_id/importer/:action', :controller => 'importer'
  end
end
