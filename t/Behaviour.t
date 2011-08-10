use strict;
use warnings;

use Test::More 'no_plan';

BEGIN {
  use_ok('Test::More::Behaviour')
};

describe 'Account' => sub {
  it 'deposits money' => sub {
    is(1, 1);
  };
  it 'withdrawals money' => sub {
    is(1, 1);
  };
  it 'transfers money' => sub {
    is(1, 1);
  };
};

describe 'Account with context' => sub {
  context 'when transferring money' => sub {
    it 'withdrawals amount from the original account' => sub {
      is(1, 1);
    };
    it 'deposits amount to the target account' => sub {
      is(1, 1);
    };
  };

  it 'does something outside of the previous context' => sub {
    is(1, 1);
  };
};

describe 'Account outside of context' => sub {
  it 'does other stuff' => sub {
    is(1, 1);
  };
};
