package Test::More::Behaviour;

use 5.010000;
use strict;
use warnings;

use base 'Test::More';
use Test::More;
use Term::ANSIColor;

use version; our $VERSION = qv('0.4.0');

our @EXPORT = ( @Test::More::EXPORT, qw(describe context it) );

my $spec_desc;
my $context_desc;
my $passed = 1;

sub describe {
  $spec_desc = shift;
  my $block  = shift;
  $block->();
  $spec_desc = undef;

  return;
}

sub context {
  $context_desc = shift;
  my $block     = shift;
  $block->();
  $context_desc = undef;

  return;
}

sub it {
  my $description = shift;
  my $block       = shift;

  caller->set_up if caller->can('set_up');
  _evaluate_and_print_subtest($description, $block);
  caller->tear_down if caller->can('tear_down');

  return;
}

sub _evaluate_and_print_subtest {
  my $desc  = shift;
  my $block = shift;

  return _subtest(_construct_description($desc) => _subtest_block($block));
}

sub _subtest {
    my $desc  = shift;
    my $block = shift;

    $block->();
    print $desc->(),"\n";

    return;
}

sub _subtest_block {
  my $block = shift;
  return sub {
    eval {
      $passed = $block->();
      1;
    } or do {
      $passed = 0;
      fail($@);
    };
  };
}

sub _construct_description {
  my $result = shift;

  $result = "$spec_desc\n  $result" if $spec_desc and (! $context_desc);
  $result = "$spec_desc\n  $context_desc\n    $result" if $spec_desc and $context_desc;

  return sub { colored [$passed ? 'green' : 'red'], $result };
}

1;
