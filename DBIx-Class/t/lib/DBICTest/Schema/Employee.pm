package # hide from PAUSE 
    DBICTest::Schema::Employee;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components(qw( Ordered ));

__PACKAGE__->table('employee');

__PACKAGE__->add_columns(
    employee_id => {
        data_type => 'integer',
        is_auto_increment => 1
    },
    position => {
        data_type => 'integer',
    },
    group_id => {
        data_type => 'integer',
        is_nullable => 1,
    },
    name => {
        data_type => 'varchar',
        size      => 100,
        is_nullable => 1,
    },
);

__PACKAGE__->set_primary_key('employee_id');
__PACKAGE__->position_column('position');

#__PACKAGE__->add_unique_constraint(position_group => [ qw/position group_id/ ]);

__PACKAGE__->mk_classdata('field_name_for', {
    employee_id => 'primary key',
    position    => 'list position',
    group_id    => 'collection column',
    name        => 'employee name',
});

1;
