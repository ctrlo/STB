package STB::Schema::Result::Approval;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

STB::Schema::Result::Approval

=cut

__PACKAGE__->table("approval");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 approved

  data_type: 'smallint'
  default_value: 0
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 request_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "approved",
  { data_type => "smallint", default_value => 0, is_nullable => 0 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "request_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user

Type: belongs_to

Related object: L<STB::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "STB::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q2F/M3w2oaK2W/aKITnZjw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
