Setup:

  $ source $TESTDIR/setup.sh
  done
  $ echo a >> ./foo
  $ echo b >> ./foo
  $ echo c >> ./foo
  $ echo d >> ./foo
  $ echo e >> ./foo
  $ echo f >> ./foo
  $ echo g >> ./foo
  $ echo h >> ./foo
  $ echo i >> ./foo

Default context is none:

  $ ag e
  ./foo:5:e

Change the lines before with --before:

  $ ag --before=0 e
  ./foo:5:e
  $ ag --before=1 e
  ./foo:4-d
  ./foo:5:e
  $ ag --before=2 e
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  $ ag --before=3 e
  ./foo:2-b
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e

Change the lines after with --after:

  $ ag --after=0 e
  ./foo:5:e
  $ ag --after=1 e
  ./foo:5:e
  ./foo:6-f
  $ ag --after=2 e
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  $ ag --after=3 e
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  ./foo:8-h

Change both at once with --context:

  $ ag --context=0 e
  ./foo:5:e
  $ ag --context=1 e
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  $ ag --context=2 e
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  $ ag --context=3 e
  ./foo:2-b
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  ./foo:8-h
  $ ag --context=4 e
  ./foo:1-a
  ./foo:2-b
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  ./foo:8-h
  ./foo:9-i
  $ ag -C0 e
  ./foo:5:e
  $ ag -C1 e
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  $ ag -C2 e
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  $ ag -C3 e
  ./foo:2-b
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  ./foo:8-h
  $ ag -C4 e
  ./foo:1-a
  ./foo:2-b
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  ./foo:8-h
  ./foo:9-i

Context should merge cleanly if match contexts overlap:

  $ ag -C0 '[df]'
  ./foo:4:d
  ./foo:6:f
  $ ag -C2 '[df]'
  ./foo:2-b
  ./foo:3-c
  ./foo:4:d
  ./foo:5-e
  ./foo:6:f
  ./foo:7-g
  ./foo:8-h

Later options override earlier ones:

  $ ag -C 1 -C 2 e
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  $ ag -C 1 -C 2 -C 0 e
  ./foo:5:e
  $ ag --before 1 --before 2 e
  ./foo:3-c
  ./foo:4-d
  ./foo:5:e
  $ ag --before 1 --before 2 --before 0 e
  ./foo:5:e
  $ ag --after 1 --after 2 e
  ./foo:5:e
  ./foo:6-f
  ./foo:7-g
  $ ag --after 1 --after 2 --after 0 e
  ./foo:5:e

