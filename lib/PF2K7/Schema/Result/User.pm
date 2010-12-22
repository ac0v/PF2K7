package PF2K7::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

PF2K7::Schema::Result::User

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 email

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 name

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 town

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 country

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 motto1

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 256

=head2 motto2

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 256

=head2 username

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 password

  data_type: 'char'
  is_nullable: 0
  size: 64

=head2 gps

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 enneagram1

  data_type: 'int'
  default_value: 0
  is_nullable: 0
  size: 8

=head2 enneagram2

  data_type: 'int'
  default_value: 0
  is_nullable: 0
  size: 8

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "email",
  { data_type => "char", default_value => "", is_nullable => 0, size => 64 },
  "name",
  { data_type => "char", default_value => "", is_nullable => 0, size => 64 },
  "town",
  { data_type => "char", default_value => "", is_nullable => 0, size => 64 },
  "country",
  { data_type => "char", default_value => "", is_nullable => 0, size => 64 },
  "motto1",
  { data_type => "char", default_value => "", is_nullable => 0, size => 256 },
  "motto2",
  { data_type => "char", default_value => "", is_nullable => 0, size => 256 },
  "username",
  { data_type => "char", default_value => "", is_nullable => 0, size => 64 },
  "password",
  { data_type => "char", is_nullable => 0, size => 64 },
  "gps",
  { data_type => "char", default_value => "", is_nullable => 0, size => 16 },
  "enneagram1",
  { data_type => "int", default_value => 0, is_nullable => 0, size => 8 },
  "enneagram2",
  { data_type => "int", default_value => 0, is_nullable => 0, size => 8 },
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


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-12-22 21:17:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2kvtEwG1yGJHKjZ06QXC1g

# You can replace this text with custom content, and it will be preserved on regeneration

__PACKAGE__->many_to_many( roles => "users_to_roles", "role");

1;
