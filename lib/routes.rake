  task :routes do
    require 'rails/commands/routes/routes_command'
    Rails.application.require_environment!
    cmd = Rails::Command::RoutesCommand.new
    cmd.perform
  end