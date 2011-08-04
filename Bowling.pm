package Bowling;

use strict;
use warnings;

our @EXPORT = qw(new roll score);

my @rolls;

sub new {
  return bless {rolls => []}, shift;
}

sub roll {
  push @{shift->{rolls}}, shift;
}

# sub score {
#   my $total = 0;
#   my @rolls = @{shift->{rolls}};
# 
#   for(1..10) {
#     my $pins = shift @rolls;
# 
#     if ($pins == 10) {
#       $total += $pins + $rolls[0] + $rolls[1];
#     } elsif ($pins + $rolls[0] == 10) {
#       $total += $pins + shift(@rolls) + $rolls[0];
#     } else {
#       $total += $pins + shift(@rolls);
#     }
#   }
# 
#   return $total;
# };

sub score {
  my $score = 0;
  my $pos = 0;
  @rolls = @{shift->{rolls}};

  for(1..10) {
    if(_strike($pos)) {
      $score += _score_strike($pos);
      $pos += 1;
    } elsif (_spare($pos)) {
      $score += _score_spare($pos);
      $pos += 2;
    } else {
      $score += _score_open_frame($pos);
      $pos += 2;
    }
  }
  return $score;
};

sub _score_open_frame {
  my $pos = shift;
  return _ball_one($pos) + _ball_two($pos);
};

sub _score_spare {
  my $pos = shift;
  return _ball_one($pos) + _ball_two($pos) + _bonus_ball_one($pos);
};

sub _score_strike {
  my $pos = shift;
  return _ball_one($pos) + _bonus_ball_one($pos) + _bonus_ball_two($pos);
};

sub _ball_one {
  my $pos = shift;
  return $rolls[$pos];
};

sub _ball_two {
  my $pos = shift;
  return $rolls[$pos+1];
};

sub _bonus_ball_one {
  my $pos = shift;
  return $rolls[$pos+2];
};

sub _bonus_ball_two {
  my $pos = shift;
  return $rolls[$pos+1];
};

sub _strike {
  my $pos = shift;
  if(10 == _ball_one($pos)) {
    return 1;
  } else {
    return 0;
  }
};

sub _spare {
  my $pos = shift;
  if (10 == _ball_one($pos) + _ball_two($pos) and 10 > _ball_one($pos)) {
    return 1;
  } else {
    return 0;
  }
};

1;
