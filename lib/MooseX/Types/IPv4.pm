package MooseX::Types::IPv4; {

  use MooseX::Types
    -declare => [qw/ip2 ip3 ip4/];

  use MooseX::Types::Moose qw/Str/;

  our $VERSION = '0.01';


  my $ip2valr .= '';
  my $ip3valr .= '';

  my $ip4valr .= '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}';
     $ip4valr .= '(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';


  ## No validation here yet. This is for a.b notation.
  ## I don't use it, but prototyped it in anyway.
  subtype ip2,
    as Str,
    where { /$ip2valr/ },
    message { "$_ is not a valid ip address " };


  ## No validation here yet. This is for a.b.c notation.
  ## I don't use it, but prototyped it in anyway.
  subtype ip3,
    as Str,
    where { /$ip3valr/ },
    message { "$_ is not a valid ip address " };


  ## This will validate a regular dot-quad ip address. I personally only use
  ## this to validate user input before converting my ip addresses to binary
  ## which is how I do all of my ip address manipulations.
  subtype ip4,
    as Str,
    where { /$ip4valr/ },
    message { "$_ is not a valid ip address " };

}

1;

__END__

=head1 NAME

MooseX::Types::IPv4 - IP Address types

=head1 SYNOPSIS

    package MyClass;
    use Moose;
    use MooseX::Types::IPv4 qw/ip2 ip3 ip4/;
    use namespace::autoclean;

    has 'ipaddress2' => ( isa => ip2, is => 'rw' required => 1 );
    has 'ipaddress3' => ( isa => ip3, is => 'rw' required => 1 );
    has 'ipaddress4' => ( isa => ip4, is => 'rw' required => 1 );

=head1 DESCRIPTION

Moose type constraints that provide ip validation

=head1 SEE ALSO

=over

=item L<Moose::Util::TypeConstraints>

=item L<MooseX::Types>

=back

=head1 AUTHORS

Kyle Hultman C<< <khultman@gmail.com> >>

=head1 COPYRIGHT

Copyright 2009 the above L<AUTHORS>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under the same
terms as Perl itself.

=cut

