## PerlSpec ##

install `Test::More`

```
$ cpan Test::More
```

Just download `PerlSpec.pm`, add to your project and `use`.

```
use PerlSpec 'no_plan';

describe 'PerlSpec' => sub {
  it 'makes testing Perl awesome!' => sub {
    ok($testing_perl eq 'awesome', '');
  };
};
```

For a more detailed example, see `examples/BowlingSpec.t`

To run `BowlingSpec.t`

```
$ cd examples
$ perl -I ../ BowlingSpec.t
```

