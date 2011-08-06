use ExtUtils::MakeMaker;

WriteMakefile(
  NAME              => 'PerlSpec',
  VERSION_FROM      => 'lib/PerlSpec.pm',
  PREREQ_PM         => {
    "version"  => "0.77"
  }
);
