#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;

print "Please enter the amount of VM's nodes you want to initially create.\n";
my $user_vm_count = <STDIN>;
chomp $user_vm_count;

system "VBoxManage clonevm 'Ubuntu Template' --name 'Ubuntu Server Main Node' --register";
system "VBoxManage startvm 'Ubuntu Server Main Node'";

exit 0 if ($user_vm_count eq "");

for (my $vm_number = 1; $vm_number <= $user_vm_count; $vm_number++) {
    system "VBoxManage clonevm 'Ubuntu Template' --name 'Ubuntu Server Node $vm_number' --register";

    if ($vm_number > 5) {
        system "VBoxManage startvm 'Ubuntu Server Node $vm_number' --type headless";
    }
    else {
        system "VBoxManage startvm 'Ubuntu Server Node $vm_number'";
    }

    say "$vm_number\n";
}