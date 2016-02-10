# hiera/%{::topic}

Topic can be used for releases or other "wide" settings like Apache or 
PHP version. 

You can also use topics for releases and then you switch nodes via ENC
from topic to topic (and release to release) and puppet performs the update.


```
---
php::version: "5.5"
mysql::version: "5.5.4"
```

