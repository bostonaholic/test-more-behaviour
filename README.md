[![Build Status](https://travis-ci.org/bostonaholic/test-more-behaviour.svg?branch=master)](https://travis-ci.org/bostonaholic/test-more-behaviour) [![endorse](http://api.coderwall.com/bostonaholic/endorsecount.png)](http://coderwall.com/bostonaholic)

### NAME ###

Test::More::Behaviour - BDD module for Perl

### INSTALL ###

    $ cpan -i Test::More::Behaviour

### DESCRIPTION ###

Test::More::Behaviour is a Behaviour-Driven Development module for Perl
programmers.  It is modeled after [Rspec](http://rspec.info), the BDD tool for Ruby programmers.

Because Test::More::Behaviour uses Test::More as its 'base', you can treat every Test::More::Behaviour test as if it were Test::More!

### SYNOPSIS ###

#### basic structure ####

Test::More::Behaviour uses the words `describe` and `it` so we can
express concepts of the application as we would in conversation:

    "Describe a bank account."
    "It transfers money between two accounts."

code:

    describe 'Bank Account' => sub {
        it 'transfers money between two accounts' => sub {
            my $source = BankAccount->new(100);
            my $target = BankAccount->new(0);
            $source->transfer(50, $target);

            is($source->balance, 50);
            is($target->balance, 50);
        };
    };

Then the output should be:

    Bank Account
       transfers money between two accounts

The `describe` subroutine takes a description and a block. Inside the
block you can declare examples using the `it` subroutine.

#### nested groups ####

You can also declare nested groups using the  `describe` or `context`
subroutines.

    describe 'Bank Account' => sub {
        context 'when opening without an initial amount' => sub {
            it 'has an initial balance of 0' => sub {
                ...
            };
        };
        
        context 'when opening with an initial amount of 100' => sub {
            it 'has an initial balance of 100' => sub {
                ...
            };
        };
    };

### QUICK REFERENCE ###

This project is built with the philosophy that 'Tests are the
Documentation'.  For a full set of features, please read through the
test scenarios.

Some examples are listed with the [source code](https://github.com/bostonaholic/test-more-behaviour) under `examples/`.

[BankAccount](https://github.com/bostonaholic/bankaccount-perl)

[Bowling](https://github.com/bostonaholic/bowling-perl)

#### describe ####

Used to group a set of examples of a particular behaviour of the
system that you wish you describe.

    describe 'Bank Account' sub => {
        ...
    };

#### it ####

An example to run.

    describe 'Bank Account' => sub {
        it 'transfers money between two accounts' => sub {
            ...
        };
    };

#### context ####

Used to further establish deeper relations for a set of examples.  This is best used when several examples have similar interactions with the system but have differring expectations.

    describe 'Bank Account' => sub {
        context 'when opening without an initial amount' => sub {
            it 'has an initial balance of 0' => sub {
                ...
            };
        };
        
        context 'when opening with an initial amount of 100' => sub {
            it 'has an initial balance of 100' => sub {
                ...
            };
        };
    };

#### before_all ####

#### after_all ####

These subroutines will run before and after all the `it` examples.

    sub before_all {
        ...
    };
    
    sub after_all {
        ...
    };

    describe 'Bank Account' => sub {
        it 'transfers money between two accounts' => sub {
            ...
        };
    };

#### before_each ####

#### after_each ####

Used to define code which executes before and after each `it` example.

    sub before_each {
        ...
    };
    
    sub after_each {
        ...
    };

    describe 'Bank Account' => sub {
        it 'transfers money between two accounts' => sub {
            ...
        };
    };

### SOURCE ###

The source code for Test::More::Behaviour can be found at [https://github.com/bostonaholic/test-more-behaviour](https://github.com/bostonaholic/test-more-behaviour)

### BUGS AND LIMITATIONS ###

Currently, each `it` will not run as a Test::More::subtest.  This is because the coloring was not working correctly because subtest needed the description before evaluating the block passed in.  If you can fix this, please submit a github pull request and I will take a look.

If you do find any bugs, please send me an email or create a
[Github Issue](https://github.com/bostonaholic/test-more-behaviour/issues)
or pull request with a failing test (and your fix if you're able to) and I will be more than happy to fix.

### DEPENDENCIES ###

[Test::More](http://search.cpan.org/~mschwern/Test-Simple-0.98/lib/Test/More.pm)

[Term::ANSIColor](http://search.cpan.org/~rra/Term-ANSIColor-3.01/ANSIColor.pm)

[version](http://search.cpan.org/~jpeacock/version-0.93/lib/version.pod)

[IO::Capture::Stdout](http://search.cpan.org/~reynolds/IO-Capture-0.05/lib/IO/Capture/Stdout.pm) (test only)

### CONTRIBUTING

Please report bugs via [Github issues](https://github.com/bostonaholic/test-more-behaviour/issues) and provide as many details as possible regarding your version of Perl, Test::More::Behaviour and anything else that may help with reproducing.

For enhancements and feature requests, please use Github issues and/or by submitting a pull request.

### AUTHOR ###

Matthew Boston &lt;matthew AT matthewboston DOT com&gt; with special thanks to Dustin Williams.

### COPYRIGHT ###

(The MIT License)

Copyright (c) 2011-2016 Matthew Boston

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
