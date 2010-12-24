package PF2K7::Form::Login;

use HTML::FormHandler::Moose;
use namespace::autoclean;

extends 'HTML::FormHandler';
use MooseX::Types::Common::String qw(NonEmptySimpleStr);

has error_invalid_account => (
    is => 'ro',
    isa => NonEmptySimpleStr,
    required => 1,
    default => 'Wrong username or password',
);

has_field 'username' => (
    type             => 'Text',
    required         => 1,
    required_message => 'please enter a username',
);
has_field 'password' => (
    type => 'Password',
    required         => 1,
    required_message => 'please enter a password',
);
has_field 'submit'   => ( type => 'Submit', value => 'Login' );

__PACKAGE__->meta->make_immutable;

1;

