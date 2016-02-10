# hiera/%{::cluster}

Cluster in this context means "a number of hosts having something in common". 
This is the same as HA Cluster or VMWare vApp or AWS Cloud Formation Stack. 

Typical settings here are IP's (e.g. for pacemaker), URL's (e.g. for elasticsearch
clusters) etc.