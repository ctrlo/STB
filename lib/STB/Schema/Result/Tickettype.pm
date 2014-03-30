package STB::Schema::Result::Tickettype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

STB::Schema::Result::Tickettype

=cut

__PACKAGE__->table("tickettype");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 legs

Type: has_many

Related object: L<STB::Schema::Result::Leg>

=cut

__PACKAGE__->has_many(
  "legs",
  "STB::Schema::Result::Leg",
  { "foreign.tickettype_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-29 21:41:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/hcn9TyNX2GGw0sPDCrGaA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
