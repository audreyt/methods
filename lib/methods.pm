package methods;
use 5.008;
our $VERSION = '0.02';

use namespace::autoclean;
use Method::Signatures::Simple;
our @ISA = 'Method::Signatures::Simple';

method import {
    namespace::autoclean->import( -cleanee => scalar(caller) );

    unshift @_, 'Method::Signatures::Simple';
    goto &Method::Signatures::Simple::import;
}

1;

__END__

=encoding utf8

=head1 NAME

methods - Provide method syntax and autoclean namespaces

=head1 SYNOPSIS

    use methods;

    # with signature
    method foo($bar, %opts) {
       $self->bar(reverse $bar) if $opts{rev};
    }

    # attributes
    method foo : lvalue { $self->{foo} }

    # change invocant name
    method foo ($class: $bar) { $class->bar($bar) }

=head1 DESCRIPTION

This module uses L<Method::Signatures::Simple> to provide named and
anonymous methods with parameters, except with a shorter module name.

It also imports L<namespace::autoclean> so the imported C<method> helper
function (as well as any imported helper functions) won't become methods
in the importing module.

=head1 SEE ALSO

L<invoker>, L<signatures>

=head1 AUTHORS

唐鳳 E<lt>cpan@audreyt.orgE<gt>

=head1 CC0 1.0 Universal

To the extent possible under law, 唐鳳 has waived all copyright and related
or neighboring rights to L<methods>.

This work is published from Taiwan.

L<http://creativecommons.org/publicdomain/zero/1.0>

=cut
