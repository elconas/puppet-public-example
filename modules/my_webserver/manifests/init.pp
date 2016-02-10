class my_webserver (
    $my_vhosts = {},
) inherits stdlib {

    include apache

    create_resources(apache::vhost, $my_vhosts)

    # My Content Files 
    file { "/var/www/webmail/index.html": 
       ensure => 'file',
       content => "<html><head></head><body><h1> Welcome to my Webmail on ${::fqdn} ($::clientcert)</h1></body></html>",
       owner => 'apache',
       group => 'apache',
       tag => 'myhomepages',
    }

    file { "/var/www/html/index.html": 
       ensure => 'file',
       content => "<html><head></head><body><h1> Welcome to my Webpage on ${::fqdn} ($::clientcert)</h1></body></html>",
       owner => 'apache',
       group => 'apache',
       tag => 'myhomepages',
    }

    file { "/var/www/blog/index.html": 
       ensure => 'file',
       content => "<html><head></head><body><h1> Welcome to my Blog on ${::fqdn} ($::clientcert)</h1></body></html>",
       owner => 'apache',
       group => 'apache',
       tag => 'myhomepages',
    }

    # Dependency, vhosts first (creates the directory and then the content)
    # Ordering in Puppet is "random" - so everything explicit please 
    Apache::Vhost <| |> -> File <| tag == 'myhomepages' |>

}

# vim modeline - have 'set modeline' and 'syntax on' in your ~/.vimrc.
# vi:syntax=puppet:filetype=puppet:ts=4:et:


