package STB::Schema::Result::Leg;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

STB::Schema::Result::Leg

=cut

__PACKAGE__->table("leg");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 request_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 departure

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 destination

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 departure_time

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 destination_time

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 flight_number

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 tickettype_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 notes

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "request_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "departure",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "destination",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "departure_time",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "destination_time",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "flight_number",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "tickettype_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "notes",
  { data_type => "text", is_nullable => 1 },
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

=head2 tickettype

Type: belongs_to

Related object: L<STB::Schema::Result::Tickettype>

=cut

__PACKAGE__->belongs_to(
  "tickettype",
  "STB::Schema::Result::Tickettype",
  { id => "tickettype_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 members

Type: has_many

Related object: L<STB::Schema::Result::Member>

=cut

__PACKAGE__->has_many(
  "members",
  "STB::Schema::Result::Member",
  { "foreign.leg_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-29 21:41:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6B40c4DTb7/NuGkkA7k6Pw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
