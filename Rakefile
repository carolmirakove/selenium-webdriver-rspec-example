def run_in_parallel(processes, tag)
  system("parallel_rspec -n #{processes} --test-options '-r rspec --order random --tag #{tag}' spec")
end

namespace :desktop do

  # example:
  # rake desktop:local[chrome]
  desc 'Run tests on local build by browser'
  task :local, :browser do |t, args|
    ENV['browser'] = args[:browser]
    ENV['base_url'] = 'local'
    run_in_parallel('4', '~skip')
  end

  # example:
  # rake desktop:production[chrome]
  desc 'Run tests on Production by browser'
  task :production, :browser do |t, args|
    ENV['browser'] = args[:browser]
    ENV['base_url'] = 'production'
    run_in_parallel('4', '~skip')
  end

  # example:
  # rake desktop:focus[local,firefox]
  desc 'Run tests tagged focus by base_url and browser'
  task :focus, :base_url, :browser do |t, args|
    ENV['base_url'] = args[:base_url]
    ENV['browser'] = args[:browser]
    run_in_parallel('1', 'focus')
  end
end

namespace :cloud do
  
  # see https://docs.saucelabs.com/reference/platforms-configurator/#/ for OS and browsers

  # examples:
  # rake cloud:focus[integration,'Windows 8','internet_explorer','10.0']
  # rake cloud:focus[integration,'Windows 8.1','firefox','36.0']
  desc 'Run tests tagged focus on integration by OS, browser, and browser version'
  task :focus, :base_url, :operating_system, :browser, :browser_version do |t, args|
    ENV['host'] = 'saucelabs'
    ENV['base_url'] = args[:base_url]
    ENV['operating_system'] = args[:operating_system]
    ENV['browser'] = args[:browser]
    ENV['browser_version'] = args[:browser_version]
    run_in_parallel('1', 'focus')
  end

  # example:
  # rake cloud:integration['Windows 8.1','internet_explorer','11.0']
  desc 'Run tests on integration by OS, browser, and browser version'
  task :integration, :operating_system, :browser, :browser_version do |t, args|
    ENV['host'] = 'saucelabs'
    ENV['base_url'] = 'integration'
    ENV['operating_system'] = args[:operating_system]
    ENV['browser'] = args[:browser]
    ENV['browser_version'] = args[:browser_version]
    run_in_parallel('4', '~skip')
  end
end
