Setup:

  $ source $TESTDIR/setup.sh
  done
  $ echo Foo >> ./sample
  $ echo bar >> ./sample

Ag is case sensitive by default, for both literals and regexes:

  $ ag foo
  $ ag Foo
  ./sample:1:Foo
  $ ag FOO
  $ ag bar
  ./sample:2:bar
  $ ag Bar

  $ ag 'f.o'
  $ ag 'F.o'
  ./sample:1:Foo
  $ ag 'b.r'
  ./sample:2:bar

Case insensitive mode can be turned on:

  $ ag foo -i
  ./sample:1:Foo
  $ ag foo --ignore-case
  ./sample:1:Foo
  $ ag BAr -i
  ./sample:2:bar

  $ ag 'f.o' -i
  ./sample:1:Foo
  $ ag 'BA[r]' -i
  ./sample:2:bar

Case sensitive mode can be explicitly enabled:

  $ ag foo -s
  $ ag Foo -s
  ./sample:1:Foo

Smart casing is case sensitive if there is an uppercase letter in the pattern,
case insensitive otherwise:

  $ ag foo -S
  ./sample:1:Foo
  $ ag Foo -S
  ./sample:1:Foo
  $ ag FoO -S
  $ ag bar -S
  ./sample:2:bar

  $ ag baR -S
  $ ag '[f]oo' -S
  ./sample:1:Foo
  $ ag '[F]oo' -S
  ./sample:1:Foo
  $ ag '[f]oO' -S

Later options override earlier ones:

  $ ag foo -s
  $ ag foo -si
  ./sample:1:Foo
  $ ag foo -sis
  $ ag foo -sisS
  ./sample:1:Foo
  $ ag foO -sisS
  $ ag foo -sisSs

