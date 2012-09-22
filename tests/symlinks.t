Setup:

  $ source $TESTDIR/setup.sh
  done

Create four directories with a file in each:

  $ mkdir other1
  $ echo foo > other1/foo.txt
  $ mkdir other2
  $ echo bar > other2/bar.txt
  $ mkdir other3
  $ echo baz > other3/baz.txt
  $ mkdir other4
  $ echo cats > other4/cats.txt

Create a base directory that we're going to be searching in.

  $ mkdir base

Create four symlinks: one each from the cartesian product of (absolute source,
relative source path) and (symlink to file, symlink to directory):

  $ ln -s ../other1     base/linked-other1
  $ ln -s `pwd`/other2  base/linked-other2

  $ ln -s ../other3/baz.txt      base/linked-baz.txt
  $ ln -s `pwd`/other4/cats.txt  base/linked-cats.txt

Move into the base directory:

  $ cd base

By default symlinks are not followed:

  $ ag foo
  $ ag bar
  $ ag baz
  $ ag cats
  $ ag --nofollow foo
  $ ag --nofollow bar
  $ ag --nofollow baz
  $ ag --nofollow cats

--follow turns on symlink following (and it works for all four types):

  $ ag --follow foo
  ./linked-other1/foo.txt:1:foo
  $ ag --follow bar
  ./linked-other2/bar.txt:1:bar
  $ ag --follow baz
  ./linked-baz.txt:1:baz
  $ ag --follow cats
  ./linked-cats.txt:1:cats

-f is the short option:

  $ ag -f foo
  ./linked-other1/foo.txt:1:foo
  $ ag -f bar
  ./linked-other2/bar.txt:1:bar
  $ ag -f baz
  ./linked-baz.txt:1:baz
  $ ag -f cats
  ./linked-cats.txt:1:cats

--nofollow can turn it off again.  Later options override earlier ones:

  $ ag foo
  $ ag --follow foo
  ./linked-other1/foo.txt:1:foo
  $ ag --nofollow foo
  $ ag --follow --nofollow foo
  $ ag --follow --nofollow -f foo
  ./linked-other1/foo.txt:1:foo
  $ ag --follow --nofollow -f --nofollow foo

