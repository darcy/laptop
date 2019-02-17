#!/usr/bin/perl -w

$uptime = `/usr/bin/uptime`;
@s = lstat '/dev/pts' or die $uptime;
$s = time - $s[10];
if ($s>172800) {
$d = int($s/86400);
$uptime =~ s/up .*?,/up $d days,/;
} else {
$h = int($s/3600);
$m = int(($s-$h*3600)/60);
$uptime =~ s/up .*?,/sprintf("up %02d:%02d,",$h,$m)/e;
}
print $uptime;
