Setup:

  $ source $TESTDIR/setup.sh
  done
  $ echo abcdefghijklmnopqrstuvwxyz >> ./sample

No columns by default:

  $ ag a
  ./sample:1:abcdefghijklmnopqrstuvwxyz
  $ ag z
  ./sample:1:abcdefghijklmnopqrstuvwxyz

Turning on columns gives the column number of the start of the match:

  $ ag --column a
  ./sample:1:1:abcdefghijklmnopqrstuvwxyz
  $ ag --column b
  ./sample:1:2:abcdefghijklmnopqrstuvwxyz

  $ ag --column y
  ./sample:1:25:abcdefghijklmnopqrstuvwxyz
  $ ag --column '..$'
  ./sample:1:25:abcdefghijklmnopqrstuvwxyz

  $ ag --column z
  ./sample:1:26:abcdefghijklmnopqrstuvwxyz
  $ ag --column '.$'
  ./sample:1:26:abcdefghijklmnopqrstuvwxyz

  $ ag --column 'e.*q'
  ./sample:1:5:abcdefghijklmnopqrstuvwxyz

