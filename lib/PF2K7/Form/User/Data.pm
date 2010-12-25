package PF2K7::Form::User::Data;

use HTML::FormHandler::Moose;
use namespace::autoclean;

extends 'HTML::FormHandler';
use MooseX::Types::Common::String qw(NonEmptySimpleStr);

has error_username_exists => (
    is => 'ro',
    isa => NonEmptySimpleStr,
    required => 1,
    default => 'Username already in use. Please choose another one.',
);

has_field 'username' => (
    type             => 'Text',
    required         => 1,
    required_message => 'please enter a username',
    css_class        => 'coll',
);
has_field 'password' => (
    type             => 'Password',
    required         => 1,
    required_message => 'please enter a password',
    css_class        => 'colr',
);
has_field 'name' => (
    type => 'Text',
);
has_field 'email' => (
    type             => 'Email',
    label            => 'Email Address',
    required         => 1,
    required_message => 'please enter your email address',
    message => [
        'Email Address should be of the format [_1]',
        'someuser@example.com'
    ],
);
has_field 'town' => (
    type             => 'Text',
    required         => 1,
    required_message => 'please enter your town',
    css_class        => 'coll',
);
has_field 'country' => (
    type             => 'Text',
    required         => 1,
    required_message => 'please enter your country',
    css_class        => 'colr',
);
has_field 'motto1' => (
    type             => 'Text',
    label            => 'Life Motto',
    required         => 1,
    required_message => 'please enter your life motto',
    css_class        => 'coll',
);
has_field 'motto2' => (
    type      => 'Text',
    label     => 'Secondary Life Motto',
    css_class => 'colr',
);
has_field 'likes' => (
    type      => 'Text',
    label     => 'Likes',
    css_class => 'coll',
);
has_field 'dislikes' => (
    type      => 'Text',
    label     => 'Dislikes',
    css_class => 'colr',
);
has_field 'gps' => (
    type  => 'Text',
    label => 'GPS Coordinates',
    apply => [{
        check   => qr{ \d+[\.\d+]? ?[NnSs] ?,? ?\d+\[.\d+]? ?[EeWw]},
        message => 'Please enter your GPS coordinates textually in decimal notation (eg. 23.516n , 02.625w)',
    }],
);
# ToDo: add multiselect for enneagram types
#       using a DB table (see top of page 7, req. spec.)
has_field 'enneagram1' => (
    type      => 'Text',
    label     => 'Primary Enneagram',
    css_class => 'coll',
);
has_field 'enneagram2' => (
    type      => 'Text',
    label     => 'Secondary Enneagram',
    css_class => 'colr',
);
has_field 'submit' => (
    type  => 'Submit',
    value => 'Register',
);

__PACKAGE__->meta->make_immutable;

1;
