class my_motd::params (
    $enabled = false,
) inherits stdlib {
    ## this is all stdlib functionality
    ## See https://forge.puppetlabs.com/puppetlabs/stdlib
    validate_bool($enabled)
}
