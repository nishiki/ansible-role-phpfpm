# Ansible role: PHP FPM
[![Version](https://img.shields.io/badge/latest_version-1.1.0-green.svg)](https://git.yaegashi.fr/nishiki/ansible-role-phpfpm/releases)
[![Build Status](https://travis-ci.org/nishiki/ansible-role-phpfpm.svg?branch=master)](https://travis-ci.org/nishiki/ansible-role-phpfpm)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://git.yaegashi.fr/nishiki/ansible-role-phpfpm/src/branch/master/LICENSE)

Install and configure PHP FPM

## Requirements

* Ansible >= 2.4
* Debian Stretch

## Role variables

* `phpfpm_version` - the php version to use (default: `7.0`)
* `phpfpm_dir_log` - directory with the phpfpm logs (default: `/var/log/phpfpm`)
* `phpfpm_packages` - array with the additionnal php packages to install
* `phpfpm_pools` -  array with the phpfpm pools

```
  - name: myappli
    user: www-myappli
    php_config:
      admin_value:
        opcache.enable: 1
        opcache.enable_cli: 1
  - name: otherappli
    user: www-otherappli
    ping_path: /ping-test
```

### Default variables for all pools

See [php pool directives documentation](http://php.net/manual/en/install.fpm.configuration.php)

* `phpfpm_ping_path` - (default: `/ping`)
* `phpfpm_ping_response` - (default: `pong`)
* `phpfpm_pm` - (default: `ondemand`)
* `phpfpm_pm_max_children` - (default: `16`)
* `phpfpm_pm_start_servers` - (default: `4`)
* `phpfpm_pm_min_spare_servers` - (default: `2`)
* `phpfpm_pm_max_spare_servers` - (default: `8`)
* `phpfpm_pm_max_requests` - (default: `500`)
* `phpfpm_pm_process_idle_timeout` - (default: `10`)
* `phpfpm_pm_status_path` - (default: `/status`)
* `phpfpm_request_slowlog_timeout` - (default: `10`)
* `phpfpm_security_limit_extensions` - (default: `.php`)

## How to use

```
- hosts: server
  roles:
    - phpfpm
```

## Development
### Tests with docker

* install [docker](https://docs.docker.com/engine/installation/)
* install ruby
* install bundler `gem install bundler`
* install dependencies `bundle install`
* run the tests `kitchen test`

## License

```
Copyright (c) 2018 Adrien Waksberg

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
