# hiera/%{::role}

Role is a collection of profiles. 

The role is the core part of class assignment. A role determines **WHAT** to 
install. The topic defined in which version (e.g. ensure => 3.4.0) and the 
other hiera layers determine parameters for the classes.

```
---
classes:
  - apache
  - mysql
  
```

