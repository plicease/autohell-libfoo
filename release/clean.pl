#!/usr/bin/perl

use strict;
use warnings;
use v5.10;
use autodie qw( :all );
use Capture::Tiny qw( capture_stdout );
use Path::Class qw( file dir );

my $root = file(__FILE__)->parent->parent;


$_->remove for grep { $_->basename =~ /\.[13]$/ } $root->subdir('man')->children;
$_->remove for grep { $_->basename =~ /\.txt$/ }  $root->subdir('doc')->children;
$_->remove for grep { $_->basename =~ /\.o$/ || $_->basename =~ /^libfoo(\.la|_la-foo\.lo)$/ }  $root->subdir('src')->children;
$_->remove for map { $root->file('src', $_) } qw( foo libfoo.a );

foreach my $ldir (['autom4te.cache'],['src','.deps'], ['m4'], ['src', '.libs'])
{
  my $dir = $root->subdir(@$ldir);

  if(-d $dir)
  {
    $_->remove for $dir->children;
    $dir->remove;
  }
}

$_->remove for map { $root->file($_) } qw( 
  depcomp install-sh missing aclocal.m4 config.h.in config.h.in config.h
  config.log config.status stamp-h1 autoscan.log config.guess config.sub
  libtool ltmain.sh configure
);

$_->remove for grep { $_->basename =~ /~$/ } $root->children;
$_->remove for map { ($root->file($_, 'Makefile'), $root->file($_, 'Makefile.in')) } qw( doc man src examples scripts );
$root->file('Makefile.in')->remove;
$root->file('Makefile')->remove;
$root->file('compile')->remove;
$root->file('pkgconfig', 'libfoo.pc')->remove;
