package Kernel::System::Cache::FakeVerifyFileStorable;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Cache::FileStorable',
);

use parent 'Kernel::System::Cache::FileStorable';

sub Get {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !defined $Param{Type} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Type!"
        );
        return;
    }

    return 'custom' if $Param{Type} eq 'PackageVerification';
    return Kernel::System::Cache::FileStorable::Get(@_);
}

1;
