use strict;
use warnings;

my $textInner =
  '(outer(inner(most "this (shouldn\'t match)" inner)))';

my $innerRe;
$innerRe = qr/
                \(
                (
                   (?:
                      [^()"]+
                   |
                      "[^"]*"
                   |
                      (??{ $innerRe })
                   )*
                )
                \)
             /sx;

$textInner =~ /^$innerRe/g;
print "outer: $1\n";
