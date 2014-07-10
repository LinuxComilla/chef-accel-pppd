accel-ppp Cookbook
==============
This cookbook installs accel-pppd software

Requirements
------------
### Supported Operating Systems
- Debian-family Linux Distributions
- RedHat-family Linux Distributions

### Cookbooks
- Depends on `checkinstall` cookbook

Attributes
----------
### Recommended tunables

* `accel['url']`
  - String. Points to the accel source codes archive location

* `accel['version']`
  - String. accel version to be compiled

* `accel['radius']`
  - Bool. Flag to compile RADIUS support
  - Defaults to `true`

* `accel['snmp']`
  - Bool. Flag to compile SNMP support
  - Defaults to `true`

* `accel['shaper']`
  - Bool. Flag to compile shaper support
  - Defaults to `true`

* `accel['modules']['log']`
  - Array. Lists the log destinations

* `accel['modules']['control']`
  - Array. Lists the activated control protocols

* `accel['modules']['auth']`
  - Array. Lists the accepted auth protocols

* `accel['modules']['other']`
  - Array. Lists support protocols

* `accel['modules']['ipv6']`
  - Array. Lists IPv6 modules

Usage
-----
#### accel-ppp::default
Just include `accel-ppp` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[accel-ppp]"
  ]
}
```

License and Authors
-------------------

- Author:: Rostyslav Fridman (rostyslav.fridman@gmail.com)

```text
Copyright 2014, Rostyslav Fridman

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
