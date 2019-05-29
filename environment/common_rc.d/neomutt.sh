# ^y by default bound by shell
# disable dsusp so we can bind ^y for vim like scolling in mutt
neomutt()
{
  old=$(stty -g)                               # Capture old termio params
  stty dsusp undef                             # Disable DSUSP
  stty discard undef                             # Disable DSUSP
  trap "rc=$?; stty $old; exit $rc" 0 1 2 3 15 # Restore termios on interrupt
  /usr/local/bin/neomutt "$@"                     # Run mutt
  stty $old                                    # Restore termios on exit
}
