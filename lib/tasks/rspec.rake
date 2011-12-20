# /lib/tasks/rspec.rake
namespace :fork do
  task :spec do
    fork do
      RSpec::Core::Runner.disable_autorun!
      RSpec::Core::Runner.run(['spec'], $stderr, $stdout) ? exit(0) : exit(1)
    end
    Process.wait
    raise 'rspec failed' unless $?.exitstatus == 0
    # exiting the fork can cause MySql to drop the connection
    # but AR doesn't notice. This mitigates.
    ActiveRecord::Base.connection.reconnect! if ActiveRecord::Base.connected?
  end
end
