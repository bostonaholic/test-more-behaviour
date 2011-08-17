package Test::More::Behaviour;

use 5.010000;
use strict;
use warnings;

use base 'Test::More';
use Test::More;
use Term::ANSIColor qw(colored);

use version; our $VERSION = qv('0.4.2');

our @EXPORT = ( @Test::More::EXPORT, qw(describe context it) );

my $spec_description;
my $context_description;
my $passed = 1;

sub describe {
  $spec_description = shift;
  my $block         = shift;

  caller->before_all if caller->can('before_all');
  $block->();
  caller->after_all if caller->can('after_all');

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
  my ($description, $block) = @_;

  caller->before_each if caller->can('before_each');
  _evaluate_and_print_subtest($description, $block);
  caller->after_each if caller->can('after_each');

  return;
}

sub _evaluate_and_print_subtest {
  my ($description, $block) = @_;

  print _subtest(_construct_description($description) => _subtest_block($block));

  return;
}

sub _subtest {
  my ($description, $block) = @_;

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

  return sub { colored [_color()], $result };
}

sub _color {
  return $passed ? 'green' : 'red';
};

__END__

=head1 NAME

Test::More::Behaviour - BDD module for Perl

=head1 INSTALL

  cpan -i Test::More::Behaviour

=head1 SYNOPSIS

  describe 'Bank Account' => sub {
    context 'transferring money' => sub {
      it 'withdrawals amount from the source account' => sub {
        my $source = BankAccount->new(100);
        my $target = BankAccount->new(0);
        $source->transfer(50, $target);
        is($source->balance, 50);
      };
      it 'deposits amount into target account' => sub {
        my $source = BankAccount->new(100);
        my $target = BankAccount->new(0);
        $source->transfer(50, $target);
        is($target->balance, 50);
      };
    };
  };

=head1 DESCRIPTION

Test::More::Behaviour is a Behaviour-Driven Development module for Perl programmers.  It is modeled after Rspec (http://rspec.info) the infamous BDD tool for Ruby programmers.

Since Test::More::Behaviour uses Test::More as its 'base', you can treat every Test::More::Behaviour test as if it were Test::More!

=head1 QUICK REFERENCE

This project is built with the philosophy that 'Tests are the Documentation'.  For a full set of features, please read through the test scenarios.

=item B<describe>

Use to group a set of examples of a particular behaviour of the system that you wish you describe.

=item B<it>

An example to run.

=item B<context>

Use this to further establish deeper relations for a set of examples.  This is best used when several examples have similar interactions with the system but have differring expectations.

=item B<before_all>
=item B<before_each>
=item B<after_each>
=item B<after_all>

You can use these to define code which executes before and after each example or only once per example group.

=head1 SOURCE

The source code for Test::More::Behaviour can be found at https://github.com/bostonaholic/test-more-behaviour

=head1 KNOWN BUGS

None, yet.  But please, send me an email or send me a github pull request with a broken test (and your fix if you're able to) and I will be more than happy to fix.

=head1 DEPENDENCIES

L<Test::More>
L<Term::ANSIColor>
L<version>
L<IO::Capture::Stdout> (test only)

=head1 AUTHOR

Matthew Boston <matthew DOT boston AT gmail DOT com> with special thanks to Dustin Williams.

* I assume no responsibility if this documentation is incorrect or outdated.  The tests are fully documenting of this software.

=cut

1;
