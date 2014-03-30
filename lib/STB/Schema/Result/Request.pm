package STB::Schema::Result::Request;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

STB::Schema::Result::Request

=cut

__PACKAGE__->table("request");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 justification

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "justification",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 accommodations

Type: has_many

Related object: L<STB::Schema::Result::Accommodation>

=cut

__PACKAGE__->has_many(
  "accommodations",
  "STB::Schema::Result::Accommodation",
  { "foreign.request_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 approvals

Type: has_many

Related object: L<STB::Schema::Result::Approval>

=cut

__PACKAGE__->has_many(
  "approvals",
  "STB::Schema::Result::Approval",
  { "foreign.request_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 legs

Type: has_many

Related object: L<STB::Schema::Result::Leg>

=cut

__PACKAGE__->has_many(
  "legs",
  "STB::Schema::Result::Leg",
  { "foreign.request_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2014-03-29 21:41:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zkIwzY8iL/eFWmEcp7BLJA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
