Setup:

  $ source $TESTDIR/setup.sh
  done

Test the usage:

  $ bare_ag
  Usage: ag [OPTIONS] PATTERN [PATH]
  
  Recursively search for PATTERN in PATH.
  Like grep or ack, but faster.
  
  Example: ag -i foo /bar/
  
  Search options:
  
  --ackmate: Output results in a format parseable by AckMate.
  -A --after [LINES]: Print lines before match. Defaults to 2.
  -B --before [LINES]: Print lines after match. Defaults to 2.
  --[no]break: Print a newline between matches in different files. Enabled by default.
  --[no]color: Print color codes in results. Enabled by default.
  --column: Print column numbers in results.
  -C --context [LINES]: Print lines before and after matches. Defaults to 2.
  -D --debug: Ridiculous debugging. Probably not useful.
  --depth NUM: Search up to NUM directories deep. Default is 25.
  -f --follow: Follow symlinks.
  --[no]group: Same as --[no]break --[no]heading
  -g PATTERN: Print filenames that match PATTERN
  -G, --file-search-regex PATTERN: Only search file names matching PATTERN
  -i, --ignore-case
  --invert-match
  --[no]heading
  -l --files-with-matches: Only print filenames containing matches, not matching lines.
  -Q --literal: Do not parse PATTERN as a regular expression. Try to match it literally.
  -m --max-count NUM: Skip the rest of a file after NUM matches. Default is 10,000.
  --print-long-lines: Print matches on very long lines (> 2k characters by default)
  --search-binary: Search binary files for matches.
  --stats: Print stats (files scanned, time taken, etc)
  -w --word-regexp: Only match whole words.
  
  [1]

And the help:

  $ bare_ag -h
  Usage: ag [OPTIONS] PATTERN [PATH]
  
  Recursively search for PATTERN in PATH.
  Like grep or ack, but faster.
  
  Example: ag -i foo /bar/
  
  Search options:
  
  --ackmate: Output results in a format parseable by AckMate.
  -A --after [LINES]: Print lines before match. Defaults to 2.
  -B --before [LINES]: Print lines after match. Defaults to 2.
  --[no]break: Print a newline between matches in different files. Enabled by default.
  --[no]color: Print color codes in results. Enabled by default.
  --column: Print column numbers in results.
  -C --context [LINES]: Print lines before and after matches. Defaults to 2.
  -D --debug: Ridiculous debugging. Probably not useful.
  --depth NUM: Search up to NUM directories deep. Default is 25.
  -f --follow: Follow symlinks.
  --[no]group: Same as --[no]break --[no]heading
  -g PATTERN: Print filenames that match PATTERN
  -G, --file-search-regex PATTERN: Only search file names matching PATTERN
  -i, --ignore-case
  --invert-match
  --[no]heading
  -l --files-with-matches: Only print filenames containing matches, not matching lines.
  -Q --literal: Do not parse PATTERN as a regular expression. Try to match it literally.
  -m --max-count NUM: Skip the rest of a file after NUM matches. Default is 10,000.
  --print-long-lines: Print matches on very long lines (> 2k characters by default)
  --search-binary: Search binary files for matches.
  --stats: Print stats (files scanned, time taken, etc)
  -w --word-regexp: Only match whole words.
  
  $ bare_ag --help
  Usage: ag [OPTIONS] PATTERN [PATH]
  
  Recursively search for PATTERN in PATH.
  Like grep or ack, but faster.
  
  Example: ag -i foo /bar/
  
  Search options:
  
  --ackmate: Output results in a format parseable by AckMate.
  -A --after [LINES]: Print lines before match. Defaults to 2.
  -B --before [LINES]: Print lines after match. Defaults to 2.
  --[no]break: Print a newline between matches in different files. Enabled by default.
  --[no]color: Print color codes in results. Enabled by default.
  --column: Print column numbers in results.
  -C --context [LINES]: Print lines before and after matches. Defaults to 2.
  -D --debug: Ridiculous debugging. Probably not useful.
  --depth NUM: Search up to NUM directories deep. Default is 25.
  -f --follow: Follow symlinks.
  --[no]group: Same as --[no]break --[no]heading
  -g PATTERN: Print filenames that match PATTERN
  -G, --file-search-regex PATTERN: Only search file names matching PATTERN
  -i, --ignore-case
  --invert-match
  --[no]heading
  -l --files-with-matches: Only print filenames containing matches, not matching lines.
  -Q --literal: Do not parse PATTERN as a regular expression. Try to match it literally.
  -m --max-count NUM: Skip the rest of a file after NUM matches. Default is 10,000.
  --print-long-lines: Print matches on very long lines (> 2k characters by default)
  --search-binary: Search binary files for matches.
  --stats: Print stats (files scanned, time taken, etc)
  -w --word-regexp: Only match whole words.
  

The error message when you forget a pattern:

  $ bare_ag --smart-case
  ERR: What do you want to search for?
  [1]
  $ bare_ag -f
  ERR: What do you want to search for?
  [1]
