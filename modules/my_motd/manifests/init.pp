class my_motd (
    $enabled = $my_motd::params::enabled,
) inherits my_motd::params {
    if ($enabled) {
        class { 'motd':
            template => 'my_motd/etc/motd.erb',
        }
    }
}

# vim modeline - have 'set modeline' and 'syntax on' in your ~/.vimrc.
# vi:syntax=puppet:filetype=puppet:ts=4:et:

