package MyApp::Model::Users;

use strict;
use warnings;

my $USERS = {
  joel      => 'las3rs',
  marcus    => 'lulz',
  sebastian => 'secr3t'
};

sub new  { 
	my $class=shift;
	bless {}, $class 
}

sub check{
  my $self=shift;	
  my $user=shift;
  my $pass=shift;

  if ($USERS->{$user} && $USERS->{$user} eq $pass){
	return 1;
	}
  else{
    return undef;
  }
}
1;
