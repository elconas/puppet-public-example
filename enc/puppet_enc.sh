#!/bin/bash
#
# A sample ENC Script
#
# Please note that the if the puppetmaster includes this script as /path/to/$environment/enc/puppet_enc.sh
# $environment is the environment of the MASTER not the AGENT.
# 

# puppet client cert name (default: fqdn)
CERTNAME="$1"

LOG_TAG="PUPPET_CODE_PIPELINE"

logger -p user.notice -t $LOG_TAG "ENC Called with '$0 $*' at $(date) on $(hostname)"

declare -A PARAMETERS
ENVIRONMENT=""
CLASSES=""


### Mapping ... 
# this assumes a hiera mapping like this 
# :hierarchy:
#  - "%{::environment}/hieradata/certname/%{::clientcert}"
#  - "%{::environment}/hieradata/cluster/%{::cluster}"
#  - "%{::environment}/hieradata/role/%{::role}"
#  - "%{::environment}/hieradata/topic/%{::topic}"
#  - "%{::environment}/hieradata/location/%{::location}"
#  - "%{::environment}/hieradata/common"

  
cluster=$(echo $CERTNAME | cut -d. -f1 | cut -d- -f2 -s)
if echo $CERTNAME | grep -q -e "^stash"; then
        PARAMETERS[cluster]=${cluster:-""}
        PARAMETERS[role]="attlasian_stash"
elif echo $CERTNAME | grep -q -e "^tomcat"; then
        PARAMETERS[cluster]=${cluster:-""}
        PARAMETERS[role]="tomcat_appserver"
elif echo $CERTNAME | grep -q -e "^mysql"; then
        PARAMETERS[cluster]=${cluster:-""}
        PARAMETERS[role]="mysqlserver"
elif echo $CERTNAME | grep -q -e "^webserver"; then
        PARAMETERS[cluster]=${cluster:-""}
        PARAMETERS[role]="webserver"
fi

#### Output the yaml ...
export PARAMETERS
export ENVIRONMENT
export CLASSES

echo -e "---\nclasses:"; 
for aClass in $CLASSES; do 
	echo "  - $aClass"; 
done
if [ -n "$ENVIRONMENT" ]; then
	echo "environment: $ENVIRONMENT"
fi
echo "parameters:"
for i in "${!PARAMETERS[@]}"; do 
	echo "  $i: ${PARAMETERS[$i]}"
done

## Note: If this script exits with RC != 0, puppet aborts the run and uses
## the cached manifest
exit 0

