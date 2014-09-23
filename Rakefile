def run_in_parallel(tag)
  system("parallel_rspec #{'-n ' + ENV['processes'] if ENV['processes']} --test-options '-r rspec --order random --tag #{tag}' spec")
end

namespace :desktop do

  desc 'Run tests on local build with Chrome'
  task :local_chrome do
    ENV['browser'] = 'chrome'
    ENV['base_url'] = 'http://www.local-poets.org'
    run_in_parallel('~skip')
  end

  desc 'Run tests on local build with Firefox'
  task :local_firefox do
    ENV['browser'] = 'firefox'
    ENV['base_url'] = 'http://www.local-poets.org'
    run_in_parallel('~skip')
  end

  desc 'Run tests tagged debug on Production with Firefox'
  task :debug do
    ENV['browser'] = 'firefox'
    ENV['base_url'] = 'http://www.poets.org'
    run_in_parallel('debug')
  end

  desc 'Run tests on Production with Chrome'
  task :prod_chrome do
    ENV['browser'] = 'chrome'
    ENV['base_url'] = 'http://www.poets.org'
    run_in_parallel('~skip')
  end

  desc 'Run tests on Production with Firefox'
  task :prod_firefox do
    ENV['browser'] = 'firefox'
    ENV['base_url'] = 'http://www.poets.org'
    run_in_parallel('~skip')
  end

end
