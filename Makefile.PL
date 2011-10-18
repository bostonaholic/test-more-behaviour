use ExtUtils::MakeMaker;

WriteMakefile(
  NAME              => 'Test::More::Behaviour',
  AUTHOR            => 'Matthew Boston <matthew.boston@gmail.com>',
  VERSION_FROM      => 'lib/Test/More/Behaviour.pm',
  ABSTRACT_FROM     => 'lib/Test/More/Behaviour.pm',
  PREREQ_PM         => {
    'IO::Capture::Stdout' => 0,
    'Term::ANSIColor'     => 0,
    'Test::More'          => 0.87,
    'version'             => 0.77
  },
  dist              => { COMPRESS => 'gzip -9f', SUFFIX => 'gz' },
  clean             => { FILES => 'Test-More-Behaviour-*' }
);
