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
$_->remove for grep { $_->basename =~ /\.o$/ }  $root->subdir('src')->children;

$root->file('src', 'foo')->remove;

foreach my $ldir (['autom4te.cache'],['src','.deps'])
{
  my $dir = $root->subdir(@$ldir);

  if(-d $dir)
  {
    $_->remove for $dir->children;
    $dir->remove;
  }
}

$_->remove for map { $root->file($_) } qw( depcomp install-sh missing aclocal.m4 config.h.in config.h.in config.h config.log config.status stamp-h1 autoscan.log );
$_->remove for map { ($root->file($_, 'Makefile'), $root->file($_, 'Makefile.in')) } qw( doc man src examples scripts );
$root->file('Makefile.in')->remove;
$root->file('Makefile')->remove;

