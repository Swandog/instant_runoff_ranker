

use warnings;
use strict;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Voter;
use Ranking;

my @voters=(
            Voter->new(
                       name => 'Baseball Prospectus',
                       preference => [
                                      'Hawkins',
                                      'Thompson',
                                      'Sanchez',
                                      'Johnson',
                                      'Snodgress',
                                      'Rienzo',
                                      'Walker',
                                      'Beck',
                                      'Jaye',
                                      'Barnum',
                                     ],
                      ),
            Voter->new(
                       name => 'Baseball America',
                       preference => [
                                      'Hawkins',
                                      'Thompson',
                                      'Sanchez',
                                      'Johnson',
                                      'Walker',
                                      'Snodgress',
                                      'Rienzo',
                                      'Barnum',
                                      'Mitchell',
                                      'Beck',
                                     ],
                      ),
            Voter->new(
                       name => 'John Sickels',
                       preference => [
                                      'Hawkins',
                                      'Sanchez',
                                      'Thompson',
                                      'Johnson',
                                      'Snodgress',
                                      'Walker',
                                      'DeMichele',
                                      'Rienzo',
                                      'Barnum',
                                      'Beck',
                                      'Molina',
                                      'Semien',
                                      'Smith',
                                      'Mitchell',
                                      'Saladino',
                                      'Marinez',
                                      'Castro',
                                      'Leesman',
                                      'Phegley',
                                      'Brennan',
                                     ],
                      ),
            Voter->new(
                       name => 'South Side Sox',
                       preference => [
                                      'Hawkins',
                                      'Sanchez',
                                      'Thompson',
                                      'Snodgress',
                                      'Rienzo',
                                      'Johnson',
                                      'Walker',
                                      'Castro',
                                      'Mitchell',
                                      'Olacio',
                                     ],
                      ),
            Voter->new(
                       name => 'Future Sox',
                       preference => [
                                      'Hawkins',
                                      'Thompson',
                                      'Castro',
                                      'Johnson',
                                      'Sanchez',
                                      'Barnum',
                                      'Rienzo',
                                      'Walker',
                                      'Snodgress',
                                      'Beck',
                                      'Mitchell',
                                      'Molina',
                                      'Leesman',
                                      'Saladino',
                                      'Phegley',
                                      'Semien',
                                      'Rodriguez',
                                      'Marinez',
                                      'DeMichele',
                                      'Omogrosso',
                                      'Ravelo',
                                      'Petricka',
                                      'Olacio',
                                      'Soptic',
                                      'Smith',
                                     ],
                      ),
            Voter->new(
                       name => 'MLB.com',
                       preference => [
                                      'Thompson',
                                      'Hawkins',
                                      'Leesman',
                                      'Molina',
                                      'Walker',
                                      'Snodgress',
                                      'Sanchez',
                                      'Johnson',
                                      'Mitchell',
                                      'Barnum',
                                     ],
                      ),
           );


my $ranking=Ranking->new(voters => \@voters);
print $ranking->ranking_text;
