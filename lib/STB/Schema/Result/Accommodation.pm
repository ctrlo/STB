package STB::Schema::Result::Accommodation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

STB::Schema::Result::Accommodation

=cut

__PACKAGE__->table("accommodation");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 location

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 arrival

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 departure

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 notes

  data_type: 'text'
  is_nullable: 1

=head2 request_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "location",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "arrival",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "departure",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "notes",
  { data_type => "text", is_nullable => 1 },
  "request_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 request

Type: belongs_to

Related object: L<STB::Schema::Result::Request>

=cut

__PACKAGE__->belongs_to(
  "request",
  "STB::Schema::Result::Request",
  { id => "request_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-29 21:41:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Lq5VlbMO4yWe227S3QUe9Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
