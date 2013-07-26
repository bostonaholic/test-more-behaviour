# How to release a new version #

* Update Changes file

* Update version in lib/Test/More/Behaviour.pm

* Commit

* `$ git tag <version>`

* Follow instructions below for creating the module

# How to make the module for CPAN #

`$ perl Makefile.pl`

`$ make`

`$ make test`

`$ make dist`

`$ [sudo] make install` optional to install on the system

upload to [PAUSE](https://pause.perl.org)
