package DBIx::Class::ResultSourceHandle;

use strict;
use warnings;
use Storable;

use base qw/DBIx::Class/;

use overload
    # on some RH perls the following line causes serious performance problem
    # see https://bugzilla.redhat.com/show_bug.cgi?id=196836
    q/""/ => sub { __PACKAGE__ . ":" . shift->source_moniker; },
    fallback => 1;

__PACKAGE__->mk_group_accessors('simple' => qw/schema source_moniker/);

# Schema to use when thawing.
our $thaw_schema;

=head1 NAME

DBIx::Class::ResultSourceHandle

=head1 DESCRIPTION

This module removes fixed link between Rows/ResultSets and the actual source
objects, which gets round the following problems

=over 4

=item *

Needing to keep C<$schema> in scope, since any objects/result_sets
will have a C<$schema> object through their source handle

=item *

Large output when using Data::Dump(er) since this class can be set to
stringify to almost nothing

=item *

Closer to being able to do a Serialize::Storable that doesn't require class-based connections

=back

=head1 METHODS

=head2 new

=cut

sub new {
    my ($class, $data) = @_;

    $class = ref $class if ref $class;

    bless $data, $class;
}

=head2 resolve

Resolve the moniker into the actual ResultSource object

=cut

sub resolve { return $_[0]->schema->source($_[0]->source_moniker) }

=head2 STORABLE_freeze

Freezes a handle.

=cut

sub STORABLE_freeze {
    my ($self, $cloning) = @_;

    my $to_serialize = { %$self };
    
    delete $to_serialize->{schema};
    return (Storable::freeze($to_serialize));
}

=head2 STORABLE_thaw

Thaws frozen handle. Resets the internal schema reference to the package
variable C<$thaw_schema>. The recomened way of setting this is to use 
C<$schema->thaw($ice)> which handles this for you.

=cut


sub STORABLE_thaw {
    my ($self, $cloning,$ice) = @_;
    %$self = %{ Storable::thaw($ice) };
    $self->{schema} = $thaw_schema;
}

=head1 AUTHOR

Ash Berlin C<< <ash@cpan.org> >>

=cut

1;
