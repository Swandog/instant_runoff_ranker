package Voter;

use Moose;

has name => (
             is       => 'ro',
             isa      => 'Str',
             required => 1,
            );

has preference => (
                   is       => 'ro',
                   isa      => 'ArrayRef[Str]',
                   required => 1,
                  );

1;
