#!/usr/bin/perl

use strict;
use warnings;
use PerlSpec 'no_plan';

describe 'PerlSpec' => sub {
  it 'makes testing Perl awesome!' => sub {
    ok($testing_perl eq 'awesome', '');
  };

  it 'also makes testing Perl easy!' => sub {
    ok($testing_perl eq 'easy', '');
  };
];

1;
