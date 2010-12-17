package PF2K7::Schema::Result::Idea;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

PF2K7::Schema::Result::Idea

=cut

__PACKAGE__->table("ideas");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 text

  data_type: 'text'
  is_nullable: 0

=head2 secret

  data_type: 'char'
  default_value: 'no'
  is_nullable: 0
  size: 3

=head2 added

  data_type: 'char'
  default_value: 'unknown'
  is_nullable: 0
  size: 20

=head2 added_by

  data_type: 'char'
  default_value: 'unknown'
  is_nullable: 0
  size: 32

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "text",
  { data_type => "text", is_nullable => 0 },
  "secret",
  { data_type => "char", default_value => "no", is_nullable => 0, size => 3 },
  "added",
  {
    data_type => "char",
    default_value => "unknown",
    is_nullable => 0,
    size => 20,
  },
  "added_by",
  {
    data_type => "char",
    default_value => "unknown",
    is_nullable => 0,
    size => 32,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-12-17 21:39:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4mNZdLRZtq0d6dKh5n4CjA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
