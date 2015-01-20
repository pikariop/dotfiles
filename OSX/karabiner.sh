#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 63
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set remap.shiftDelete2forwarddelete_nomodifiers 1
/bin/echo -n .
$cli set remap.eject2forwarddelete 1
/bin/echo -n .
/bin/echo
