# My Puppet Project
## Introduction

This is a very simple project showing the roles and profiles pattern with
hiera. 

See: 
  https://puppetlabs.com/presentations/designing-puppet-rolesprofiles-pattern

### Getting Started 

### Important Files

#### ENC Script (assign Roles to nodes) 

```
/etc/puppet/environments/puppet/public/$BRANCHNAME/enc/puppet_enc.sh
```

#### Default Manifest:

```
/etc/puppet/environments/puppet/public/$BRANCHNAME/manifests/site.pp
```

#### Hiera files and structure:

  - "/etc/puppet/environments/%{::environment}/hieradata/certname/%{::clientcert}"
  - "/etc/puppet/environments/%{::environment}/hieradata/cluster/%{::cluster}"
  - "/etc/puppet/environments/%{::environment}/hieradata/role/%{::role}"
  - "/etc/puppet/environments/%{::environment}/hieradata/topic/%{::topic}"
  - "/etc/puppet/environments/%{::environment}/hieradata/location/%{::location}"
  - "/etc/puppet/environments/%{::environment}/hieradata/common"

