package BowlingSpec;

use strict;
use warnings;

use PerlSpec 'no_plan';
use Bowling;

describe 'Bowling' => sub {
  it 'returns a score of 0 for all gutter balls' => sub {
    my $game = Bowling->new;
    for(1..20) {
      $game->roll(0);
    }
    is($game->score, 0);
  };

  it 'returns a score of 20 for all single pin bowls' => sub {
    my $game = Bowling->new;
    for(1..20) {
      $game->roll(1);
    }
    is($game->score, 20);
  }
};
