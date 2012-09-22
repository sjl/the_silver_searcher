Setup:

  $ source $TESTDIR/setup.sh
  done
  $ pushd . > /dev/null
  $ for L in a b c d e f g h i j k l m n o p q r s t u v w x y z
  > do
  >   mkdir $L
  >   cd $L
  >   echo contents $L > $L.txt
  > done
  $ popd > /dev/null

Default directory depth is 25:

  $ ag --nobreak '[a-z]' | sort
  ERR: Skipping ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/z. Use the --depth option to search deeper.
  ./a/a.txt:1:contents a
  ./a/b/b.txt:1:contents b
  ./a/b/c/c.txt:1:contents c
  ./a/b/c/d/d.txt:1:contents d
  ./a/b/c/d/e/e.txt:1:contents e
  ./a/b/c/d/e/f/f.txt:1:contents f
  ./a/b/c/d/e/f/g/g.txt:1:contents g
  ./a/b/c/d/e/f/g/h/h.txt:1:contents h
  ./a/b/c/d/e/f/g/h/i/i.txt:1:contents i
  ./a/b/c/d/e/f/g/h/i/j/j.txt:1:contents j
  ./a/b/c/d/e/f/g/h/i/j/k/k.txt:1:contents k
  ./a/b/c/d/e/f/g/h/i/j/k/l/l.txt:1:contents l
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/m.txt:1:contents m
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/n.txt:1:contents n
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/o.txt:1:contents o
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/p.txt:1:contents p
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/q.txt:1:contents q
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/r.txt:1:contents r
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/s.txt:1:contents s
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/t.txt:1:contents t
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/u.txt:1:contents u
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/v.txt:1:contents v
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/w.txt:1:contents w
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/x.txt:1:contents x
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/y.txt:1:contents y

Increasing depth finds deeper files:

  $ ag --nobreak --depth 26 '[a-z]' | sort
  ./a/a.txt:1:contents a
  ./a/b/b.txt:1:contents b
  ./a/b/c/c.txt:1:contents c
  ./a/b/c/d/d.txt:1:contents d
  ./a/b/c/d/e/e.txt:1:contents e
  ./a/b/c/d/e/f/f.txt:1:contents f
  ./a/b/c/d/e/f/g/g.txt:1:contents g
  ./a/b/c/d/e/f/g/h/h.txt:1:contents h
  ./a/b/c/d/e/f/g/h/i/i.txt:1:contents i
  ./a/b/c/d/e/f/g/h/i/j/j.txt:1:contents j
  ./a/b/c/d/e/f/g/h/i/j/k/k.txt:1:contents k
  ./a/b/c/d/e/f/g/h/i/j/k/l/l.txt:1:contents l
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/m.txt:1:contents m
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/n.txt:1:contents n
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/o.txt:1:contents o
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/p.txt:1:contents p
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/q.txt:1:contents q
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/r.txt:1:contents r
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/s.txt:1:contents s
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/t.txt:1:contents t
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/u.txt:1:contents u
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/v.txt:1:contents v
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/w.txt:1:contents w
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/x.txt:1:contents x
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/y.txt:1:contents y
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/z/z.txt:1:contents z

  $ ag --nobreak --depth 100 '[a-z]' | sort
  ./a/a.txt:1:contents a
  ./a/b/b.txt:1:contents b
  ./a/b/c/c.txt:1:contents c
  ./a/b/c/d/d.txt:1:contents d
  ./a/b/c/d/e/e.txt:1:contents e
  ./a/b/c/d/e/f/f.txt:1:contents f
  ./a/b/c/d/e/f/g/g.txt:1:contents g
  ./a/b/c/d/e/f/g/h/h.txt:1:contents h
  ./a/b/c/d/e/f/g/h/i/i.txt:1:contents i
  ./a/b/c/d/e/f/g/h/i/j/j.txt:1:contents j
  ./a/b/c/d/e/f/g/h/i/j/k/k.txt:1:contents k
  ./a/b/c/d/e/f/g/h/i/j/k/l/l.txt:1:contents l
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/m.txt:1:contents m
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/n.txt:1:contents n
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/o.txt:1:contents o
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/p.txt:1:contents p
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/q.txt:1:contents q
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/r.txt:1:contents r
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/s.txt:1:contents s
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/t.txt:1:contents t
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/u.txt:1:contents u
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/v.txt:1:contents v
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/w.txt:1:contents w
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/x.txt:1:contents x
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/y.txt:1:contents y
  ./a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/z/z.txt:1:contents z

Decreasing depth cuts off earlier:

  $ ag --nobreak --depth 10 '[a-z]' | sort
  ERR: Skipping ./a/b/c/d/e/f/g/h/i/j/k. Use the --depth option to search deeper.
  ./a/a.txt:1:contents a
  ./a/b/b.txt:1:contents b
  ./a/b/c/c.txt:1:contents c
  ./a/b/c/d/d.txt:1:contents d
  ./a/b/c/d/e/e.txt:1:contents e
  ./a/b/c/d/e/f/f.txt:1:contents f
  ./a/b/c/d/e/f/g/g.txt:1:contents g
  ./a/b/c/d/e/f/g/h/h.txt:1:contents h
  ./a/b/c/d/e/f/g/h/i/i.txt:1:contents i
  ./a/b/c/d/e/f/g/h/i/j/j.txt:1:contents j

  $ ag --nobreak --depth 5 '[a-z]' | sort
  ERR: Skipping ./a/b/c/d/e/f. Use the --depth option to search deeper.
  ./a/a.txt:1:contents a
  ./a/b/b.txt:1:contents b
  ./a/b/c/c.txt:1:contents c
  ./a/b/c/d/d.txt:1:contents d
  ./a/b/c/d/e/e.txt:1:contents e

  $ ag --nobreak --depth 1 '[a-z]' | sort
  ERR: Skipping ./a/b. Use the --depth option to search deeper.
  ./a/a.txt:1:contents a

  $ ag --nobreak --depth 0 '[a-z]' | sort
  ERR: Skipping ./a. Use the --depth option to search deeper.

Later options override earlier ones:

  $ ag --nobreak --depth 255 --depth 1 '[a-z]' | sort
  ERR: Skipping ./a/b. Use the --depth option to search deeper.
  ./a/a.txt:1:contents a

  $ ag --nobreak --depth 0 --depth 1 '[a-z]' | sort
  ERR: Skipping ./a/b. Use the --depth option to search deeper.
  ./a/a.txt:1:contents a
