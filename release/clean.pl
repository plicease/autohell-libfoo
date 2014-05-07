#!/usr/bin/perl

use strict;
use warnings;
use v5.10;
use autodie qw( :all );
use Capture::Tiny qw( capture_stdout );
use Path::Class qw( file dir );

my $root = file(__FILE__)->parent->parent;

say $root;

$_->remove for grep { $_->basename =~ /\.[13]$/ } $root->subdir('man')->children;
$_->remove for grep { $_->basename =~ /\.txt$/ }  $root->subdir('doc')->children;
