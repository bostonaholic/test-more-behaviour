use strict;
use warnings;

use Test::More 'no_plan';

BEGIN {
  use_ok('Test::More::Behaviour')
};

describe 'Account' => sub {
  it 'transfers money' => sub {
    is(1, 1);
  };
  it 'deposits money' => sub {
    is(1, 1);
  };
};

describe 'Account' => sub {
  context 'transferring money' => sub {
    it 'withdrawals amount from the original account' => sub {
      is(1, 1);
    };
    it 'deposits amount to the other account' => sub {
      is(1, 1);
    };
  };
};
