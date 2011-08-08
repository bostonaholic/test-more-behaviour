use ExtUtils::MakeMaker;

WriteMakefile(
  NAME              => 'Behaviour',
  VERSION_FROM      => 'lib/Test/More/Behaviour.pm',
  PREREQ_PM         => {
    version  => 0.77
  },
  AUTHOR            => 'Matthew Boston <matthew.boston@gmail.com>'
);
