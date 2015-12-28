#!/usr/bin/env perl

use strict;
use warnings;

use Test::More::Behaviour;

BEGIN {
    use_ok('BankAccount');
}

describe 'Bank Account' => sub {
    context 'when opening an account with no initial deposit' => sub {
        it 'has an initial balance of 0.00' => sub {
            my $account = BankAccount->new();
            is($account->balance, 0.00);
        };
    };
    context 'when opening an account with an initial deposit' => sub {
        it 'has an initial balance of the deposit amount' => sub {
            my $account = new BankAccount(50.00);
            is($account->balance, 50.00);
        };
    };
    context 'when transferring money between two accounts' => sub { 
        my $initial_balance = 100.0;
        my $source = BankAccount->new($initial_balance);
        my $amount_to_transfer = 50.0;
        my $target = BankAccount->new(); # We already know it should be 0
        $source->transfer($amount_to_transfer, $target);

        it 'withdraws amount from the source account' => sub {
            is($source->balance, $initial_balance - $amount_to_transfer);
        };
        it 'deposits amount into target account' => sub {
            is($target->balance, $amount_to_transfer);
        };
    };
};

done_testing();
