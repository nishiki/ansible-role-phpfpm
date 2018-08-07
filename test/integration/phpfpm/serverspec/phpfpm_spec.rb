require 'serverspec'

set :backend, :exec

puts
puts '================================'
puts %x(ansible --version)
puts '================================'

%w[
  php7.0-fpm
  php7.0-readline
  php7.0-curl
  php7.0-mcrypt
  php7.0-gd
].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe file('/etc/logrotate.d/php7.0-fpm') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain 'rotate 14' }
end

describe file('/etc/php/7.0/fpm/php-fpm.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/php/7.0/fpm/pools.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match(/pm\s+= ondemand/) }
end

%w[slow.log access.log log].each do |ext|
  describe file("/var/log/phpfpm/www.#{ext}") do
    it { should be_file }
    it { should be_mode 640 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'www-data' }
  end
end

describe service('php7.0-fpm') do
  it { should be_enabled }
  it { should be_running.under('systemd') }
end
