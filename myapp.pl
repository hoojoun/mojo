#!/usr/bin/env perl
use Mojolicious::Lite -signatures;

use lib qw(lib);
use MyApp::Model::Users;

# Helper to lazy initialize and store our model object
helper users => sub { state $users = MyApp::Model::Users->new };

# /?user=sebastian&pass=secr3t
any '/' => sub ($c) {

  # Query parameters
  my $user = $c->param('user') || '';
  my $pass = $c->param('pass') || '';

  # Check password
  return $c->render(text => "Welcome $user.") if $c->users->check($user, $pass);

  # Failed
  $c->render(text => 'Wrong username or password.');
};

app->start;
