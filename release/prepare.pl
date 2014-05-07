#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;
use autodie qw( :all );
use Capture::Tiny qw( capture_stdout );
use Path::Class qw( file dir );

my $root = file(__FILE__)->parent->parent;

$_->mkpath(0,0755) for map { $root->subdir($_) } qw( man doc );

$root->file('man', 'foo.1')->spew(capture_stdout { system 'pod2man', 'pod/foo.pod' });
$root->file('man', 'libfoo.3')->spew(capture_stdout { system 'pod2man', 'pod/libfoo.pod' });
$root->file('doc', 'foo.txt')->spew(capture_stdout { system 'pod2text', 'pod/foo.pod' });
$root->file('doc', 'libfoo.txt')->spew(capture_stdout { system 'pod2text', 'pod/libfoo.pod' });
