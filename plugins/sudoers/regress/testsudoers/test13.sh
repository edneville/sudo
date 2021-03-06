#!/bin/sh
#
# Test sudoers file with reserved words as alias names.
# The standard error output is dup'd to the standard output.
#

# Avoid warnings about memory leaks when there is a syntax error
ASAN_OPTIONS=detect_leaks=0; export ASAN_OPTIONS

echo "Testing alias definitions using reserved words"
echo ""
./testsudoers -d <<EOF 2>&1
Cmnd_Alias ALL=ALL
Cmnd_Alias CHROOT=foo
User_Alias TIMEOUT=foo
Runas_Alias CWD=bar
Host_Alias NOTBEFORE=baz
Host_Alias NOTAFTER=biff

root ALL = ALL
EOF

exit 0
