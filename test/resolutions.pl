#!/usr/bin/perl
use Tk;
use Win32::GuiTest qw/:ALL/;
use Win32;
my $mw=tkinit;
$mw->withdraw;

$height = $mw->screenheight;
$width = $mw->screenwidth;

$height = $height/2+50;
$width = $width/2+60;
#MouseMoveAbsPix(0, 0);

&MouseMoveAbsPix($width, $height);
SendMouse('{LEFTCLICK}{LEFTCLICK}');