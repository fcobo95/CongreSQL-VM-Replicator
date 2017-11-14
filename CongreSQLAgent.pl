#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;

say "Enter the amount of VM's to create: ";
my $user_vm_count = <STDIN>;
chomp $user_vm_count;
say "A default main node will be created as well.";
say "Creating new VM's.................";

say "Creating Main Server Node............";
system "VBoxManage clonevm 'Ubuntu Template' --name 'Ubuntu Server Main Node' --register";
system "VBoxManage startvm 'Ubuntu Server Main Node'";

for (my $vm_number = 1; $vm_number <= $user_vm_count; $vm_number++) {

    if (int($vm_number - 1) == 0) {
        say "Previous VM was Ubuntu Server Main Node";
    }

    say "Previous VM was VM Ubuntu Server Node" . int($vm_number - 1);
    system "VBoxManage clonevm 'Ubuntu Template' --name 'Ubuntu Server Node $vm_number' --register";
    say "Creating next VM....";

    if ($vm_number > 5) {
        system "VBoxManage startvm 'Ubuntu Server Node $vm_number' --type headless";
    }

    else {
        system "VBoxManage startvm 'Ubuntu Server Node $vm_number'";
    }

    say "$vm_number";


}