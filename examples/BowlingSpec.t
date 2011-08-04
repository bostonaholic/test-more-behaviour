use strict;
use warnings;

use PerlSpec 'no_plan';

my $game;

sub set_up {
  $game = Bowling->new;
}

BEGIN {
  use_ok('Bowling');
}

describe 'Bowling' => sub {
  it 'returns a score of 0 for all gutter balls' => sub {
    _roll_many(20, 0);

    is($game->score, 0);
  };

  it 'returns a score of 20 for all single pin bowls' => sub {
    _roll_many(20, 1);

    is($game->score, 20);
  };

  it 'scores a spare plus next roll' => sub {
    _roll(4);
    _roll(6);
    _roll(3);
    _roll_many(17, 0);

    is($game->score, 16);
  };

  it 'scores a strike plus next two rolls' => sub {
    _roll(10);
    _roll(1);
    _roll(6);
    _roll_many(17, 0);

    is($game->score, 24);
  };

  it 'scores a perfect 300' => sub {
    _roll_many(12, 10);

    is($game->score, 300);
  };
};

sub _roll {
  _roll_many(1, shift);
}

sub _roll_many {
  my ($rolls, $pins) = @_;
  for(1..$rolls) {
    $game->roll($pins);
  }
}

1;
