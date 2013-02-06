package Ranking;

use Moose;

use Voter;

has voters => (
               is       => 'ro',
               isa      => 'ArrayRef[Voter]',
               required => 1,
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

sub _build_ranking_order_ref {
    return [];
}

sub ranking_text {
    my $self=shift;

    return
      join('',
           map {qq($_\n)} $self->ranking_order
          );
}

1;
