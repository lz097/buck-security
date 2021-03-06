#!/usr/bin/perl

use strict;
use warnings;

package mkchecksum;

# mkchecksum.pm

# MkChecksum
sub MkChecksum {
    my @checksum_dirs = grep( -d $_ , @Config::checksum_dir);
    # Create checksums
    if (@checksum_dirs) {
        `find @checksum_dirs -type f | xargs $Config::checksum_program | gpg -c > $Config::checksum_file; chmod 600 $Config::checksum_file;`;
    }
}

1;
