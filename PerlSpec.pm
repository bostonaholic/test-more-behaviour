package PerlSpec;

use warnings;
use strict;

use base 'Test::More';
use Test::More;

our @EXPORT = ( @Test::More::EXPORT, qw(it describe) );

my $spec_desc;

sub it {
  my $description = shift;
  my $block       = shift;
  main::set_up() if main->can('set_up');

  subtest _construct_description($description) => sub {
    plan 'no_plan';
    eval {
      $block->();
      1;
    } or do {
      fail($@);
    };
  };

  main::tear_down() if main->can('tear_down');
  return;
}

sub describe {
  $spec_desc = shift;
  my $block = shift;
  $block->();
  $spec_desc = undef;
  return;
}

sub _construct_description {
  my ($test_desc) = @_;
  my $result = $test_desc;
  $result = "$spec_desc $result" unless ! $spec_desc;
  return $result;
}

1;
