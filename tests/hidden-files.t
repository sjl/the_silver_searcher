Setup:

  $ source $TESTDIR/setup.sh
  done
  $ echo foo > .hidden
  $ echo foo > normal
  $ mkdir a
  $ echo foo > a/.hidden2
  $ echo foo > a/normal2

Hidden files are not searched by default (but normal ones are):

  $ ag foo | sort
  ./a/normal2:1:foo
  ./normal:1:foo

Using --hidden lets you search hidden files:

  $ ag --hidden foo | sort
  ./.hidden:1:foo
  ./a/.hidden2:1:foo
  ./a/normal2:1:foo
  ./normal:1:foo

Ignore files are still respected when using --hidden:

  $ echo '*hi*2' > .agignore
  $ ag --hidden foo | sort
  ./.hidden:1:foo
  ./a/normal2:1:foo
  ./normal:1:foo
