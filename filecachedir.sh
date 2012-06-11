#!/bin/sh

TARGET_DIR=~/work
EXCLUDE_DIR="target log logs .git tmp mnt .settings document documents doc .svn *.bak"
OUTPUT="$(basename $0 .sh).el"

EXC=""

for d in $EXCLUDE_DIR; do
  if [ -n "$EXC" ]; then
      EXC="$EXC -o -name $d"
  else
      EXC="-name $d"
  fi
done

[ -r $OUTPUT ] && rm -f $OUTPUT
echo "(setq my-filedir" >> $OUTPUT
echo " '(" >> $OUTPUT
find $TARGET_DIR \( $EXC \) -prune -o -path "*/git/*" -type d -print0 \
| perl -0 -ne 'chomp;print qq{ "$_"\n}' >> $OUTPUT
echo "))" >> $OUTPUT
#echo "(provide 'filecachedir)" >> $OUTPUT