package PF2K7::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

PF2K7::Schema::Result::User

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 password

  data_type: 'char'
  is_nullable: 0
  size: 64

=head2 status

  data_type: 'char'
  default_value: 'active'
  is_nullable: 0
  size: 16

=head2 last_whisper

  data_type: 'char'
  is_nullable: 1
  size: 20

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "username",
  { data_type => "char", default_value => "", is_nullable => 0, size => 32 },
  "password",
  { data_type => "char", is_nullable => 0, size => 64 },
  "status",
  {
    data_type => "char",
    default_value => "active",
    is_nullable => 0,
    size => 16,
  },
  "last_whisper",
  { data_type => "char", is_nullable => 1, size => 20 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 users_to_roles

Type: has_many

Related object: L<PF2K7::Schema::Result::UsersToRole>

=cut

__PACKAGE__->has_many(
  "users_to_roles",
  "PF2K7::Schema::Result::UsersToRole",
  { "foreign.user" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-12-17 20:43:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:j79oSlG8MvhTTHfNCGr7pQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
