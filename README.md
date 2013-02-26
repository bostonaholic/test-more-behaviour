[![endorse](http://api.coderwall.com/bostonaholic/endorsecount.png)](http://coderwall.com/bostonaholic)

### NAME ###

Test::More::Behaviour - BDD module for Perl

### INSTALL ###

```
$ cpan -i Test::More::Behaviour
```

### SYNOPSIS ###

``` perl
describe 'Bank Account' => sub {
  context 'transferring money' => sub {
    my $source = BankAccount->new(100);
    my $target = BankAccount->new(0);
    $source->transfer(50, $target);

    it 'withdraws amount from the source account' => sub {
      is($source->balance, 50);
    };
    it 'deposits amount into target account' => sub {
      is($target->balance, 50);
    };
  };
};
```

### DESCRIPTION ###

Test::More::Behaviour is a Behaviour-Driven Development module for Perl
programmers.  It is modeled after Rspec [http://rspec.info](http://rspec.info) the infamous BDD tool for Ruby programmers.

Because Test::More::Behaviour uses Test::More as its 'base', you can treat every Test::More::Behaviour test as if it were Test::More!

### QUICK REFERENCE ###

This project is built with the philosophy that 'Tests are the Documentation'.  For a full set of features, please read through the test scenarios.

#### describe ####

Used to group a set of examples of a particular behaviour of the system that you wish you describe.

#### it ####

An example to run.

#### context ####

Used to further establish deeper relations for a set of examples.  This is best used when several examples have similar interactions with the system but have differring expectations.

#### before_all ####

#### before_each ####

#### after_each ####

#### after_all ####

Used to define code which executes before and after each example or only once per example group.

### SOURCE ###

The source code for Test::More::Behaviour can be found at [https://github.com/bostonaholic/test-more-behaviour](https://github.com/bostonaholic/test-more-behaviour)

### BUGS AND LIMITATIONS ###

Currently, each `it` will not run as a Test::More::subtest.  This is because the coloring was not working correctly because subtest needed the description before evaluating the block passed in.  If you can fix this, please submit a github pull request and I will take a look.

If you do find any bugs, please send me an email or send me a github pull request with a broken test (and your fix if you're able to) and I will be more than happy to fix.

### DEPENDENCIES ###

[Test::More](http://search.cpan.org/~mschwern/Test-Simple-0.98/lib/Test/More.pm)

[Term::ANSIColor](http://search.cpan.org/~rra/Term-ANSIColor-3.01/ANSIColor.pm)

[version](http://search.cpan.org/~jpeacock/version-0.93/lib/version.pod)

[IO::Capture::Stdout](http://search.cpan.org/~reynolds/IO-Capture-0.05/lib/IO/Capture/Stdout.pm) (test only)

### CONTRIBUTING

Please report bugs via [Github issues](https://github.com/bostonaholic/test-more-behaviour/issues) and provide as many details as possible regarding your version of Perl, Test::More::Behaviour and anything else that may help with reproducing.

For enhancements and feature requests, please use Github issues and/or by submitting a pull request.

### AUTHOR ###

Matthew Boston &lt;matthew DOT boston AT gmail DOT com&gt; with special thanks to Dustin Williams.

### COPYRIGHT ###

(The MIT License)

Copyright (c) 2011 Matthew Boston

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
