package Ranking;

use Moose;

use Voter;
use List::AllUtils qw(min);

has voters => (
               is       => 'ro',
               isa      => 'ArrayRef[Voter]',
               traits   => ['Array'],
               required => 1,
               handles  => {
                            all_voters => 'elements',
                           },
              );

has ranking_order_ref => (
                          is       => 'ro',
                          isa      => 'ArrayRef[Str]',
                          traits   => ['Array'],
                          required => 1,
                          lazy     => 1,
                          builder  => '_build_ranking_order_ref',
                          handles  => {
                                       ranking_order => 'elements',
                                      },
                         );

sub voter_ballots {
    my $self=shift;

    return
      grep {$_}
        map {$_->ballot}
          $self->all_voters;
}

sub _build_ranking_order_ref {
    my $self=shift;

    my @ranking;
    while(my @ballots=$self->voter_ballots) {
        my $winner;
        until($winner || ! @ballots) {
            my %votes=
              map {($_ => 0)}
                map {$_->ranking}
                  @ballots;
            foreach my $ballot (@ballots) {
                $votes{$ballot->top_choice}++;
            }

            foreach my $candidate (keys %votes) {
                if($votes{$candidate}>@ballots/2) {
                    $winner=$candidate;
                }
            }

            unless($winner) {
                my $loser_total=min values %votes;
                my @losers=grep {$votes{$_}<=$loser_total} keys %votes;
                foreach my $ballot (@ballots) {
                    $ballot->eliminate(@losers);
                }
                @ballots=
                  grep {$_->has_choices}
                    @ballots;
            }
        }

        push @ranking, $winner if($winner);
    }

    return \@ranking;
}

sub ranking_text {
    my $self=shift;

    return
      join('',
           map {qq($_\n)} $self->ranking_order
          );
}

1;
