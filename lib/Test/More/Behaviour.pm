package Test::More::Behaviour;

use 5.008000;
use strict;
use warnings;

use base 'Test::More';
use Test::More;
use Test::More::Behaviour::Helper ('evaluate_and_print_subtest', 'spec_description', 'context_description');

use version; our $VERSION = '0.4.5';

our @EXPORT = ( @Test::More::EXPORT, ('describe', 'context', 'it') );

sub describe {
  spec_description(shift);
  my $block      = shift;

  caller->before_all if caller->can('before_all');
  $block->();
  caller->after_all if caller->can('after_all');

  spec_description(undef);

  return;
}

sub context {
  context_description(shift);
  my $block         = shift;

  $block->();
  context_description(undef);

  return;
}

sub it {
  my ($description, $block) = @_;

  caller->before_each if caller->can('before_each');
  evaluate_and_print_subtest($description, $block);
  caller->after_each if caller->can('after_each');

  return;
}

1;

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

Test::More::Behaviour is a Behaviour-Driven Development module for Perl programmers.  It is modeled after Rspec (F<http://rspec.info>) the infamous BDD tool for Ruby programmers.

Because Test::More::Behaviour uses Test::More as its 'base', you can treat every Test::More::Behaviour test as if it were Test::More!

=head1 QUICK REFERENCE

This project is built with the philosophy that 'Tests are the Documentation'.  For a full set of features, please read through the test scenarios.

=over

=item B<describe>

Used to group a set of examples of a particular behaviour of the system that you wish you describe.

=item B<it>

An example to run.

=item B<context>

Used to further establish deeper relations for a set of examples.  This is best used when several examples have similar interactions with the system but have differring expectations.

=item B<before_all>

=item B<before_each>

=item B<after_each>

=item B<after_all>

Used to define code which executes before and after each example or only once per example group.

=back

=head1 SOURCE

The source code for Test::More::Behaviour can be found at F<https://github.com/bostonaholic/test-more-behaviour>

=head1 BUGS AND LIMITATIONS

Currently, each `it` will not run as a Test::More::subtest.  This is because the coloring was not working correctly because subtest needed the description before evaluating the block passed in.  If you can fix this, please submit a github pull request and I will take a look.

If you do find any bugs, please send me an email or send me a github pull request with a broken test (and your fix if you're able to) and I will be more than happy to fix.

=head1 DEPENDENCIES

L<Test::More>

L<Term::ANSIColor>

L<version>

L<IO::Capture::Stdout> (test only)

=head1 AUTHOR

Matthew Boston <matthew DOT boston AT gmail DOT com> with special thanks to Dustin Williams.

=head1 COPYRIGHT

Copyright (c) 2011 Matthew Boston.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 DISCLAIMER

I assume no responsibility if this documentation is incorrect or outdated.  The tests are fully documenting of this software.

=cut
