package Test::More::Behaviour;

use 5.010000;
use strict;
use warnings;

use base 'Test::More';
use Test::More;
use Term::ANSIColor;

use version; our $VERSION = qv('0.4.1');

our @EXPORT = ( @Test::More::EXPORT, qw(describe context it) );

my $spec_description;
my $context_description;
my $passed = 1;

sub describe {
  $spec_description = shift;
  my $block         = shift;
  $block->();
  $spec_description = undef;

  return;
}

sub context {
  $context_description = shift;
  my $block            = shift;
  $block->();
  $context_description = undef;

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
  my $description = shift;
  my $block       = shift;

  print _subtest(_construct_description($description) => _subtest_block($block));

  return;
}

sub _subtest {
    my $description = shift;
    my $block       = shift;

    $block->();
    return $description->(),"\n";
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

  $result = "$spec_description\n  $result" if $spec_description and (! $context_description);
  $result = "$spec_description\n  $context_description\n    $result" if $spec_description and $context_description;

  return sub { colored [$passed ? 'green' : 'red'], $result };
}

1;
