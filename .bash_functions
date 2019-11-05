extract () {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2|*.tbz2)  tar xjf "$1"    ;;
      *.tar.gz|*.tgz)    tar xzf "$1"    ;;
      *.bz2)             bunzip2 "$1"    ;;
      *.rar)             unrar x "$1"      ;;
      *.gz)              gunzip "$1"     ;;
      *.tar)             tar xf "$1"     ;;
      *.7z)              7zr x "$1"      ;;
      *.zip|*.xpi|*.jar) unzip "$1"      ;;
      *.Z)               uncompress "$1" ;;
      *)                 echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

pwgen () {
  if [ "$#" -ne 2 -o -z "$(echo "$2" | grep -E '^[0-9]+$')" ] ; then
    echo "usage: pwgen [regex] [int]"
  else
    echo "$(tr -dc "$1" < /dev/urandom | head -c "$2")"
  fi
}

roll () {
  if [ "$#" -ne 0 ] ; then
    FILE="$1"
    case "$FILE" in
      *.tar.bz2|*.tbz2) shift && tar cjf "$FILE" $* ;;
      *.tar.gz|*.tgz)   shift && tar czf "$FILE" $* ;;
      *.tar)            shift && tar cf "$FILE" $* ;;
      *.zip)            shift && zip "$FILE" $* ;;
      *.rar)            shift && rar "$FILE" $* ;;
      *.7z)             shift && 7zr a "$FILE" $* ;;
      *)                echo "'$1' cannot be rolled via roll()" ;;
    esac
  else
    echo "usage: roll [file] [contents]"
  fi
}

sman () {
  if [ "$#" -ne 2 ] ; then
    echo "usage: sman [cmd] [pattern]"
  else
    man $1 | less -p"$2"
  fi
}

calc () {
  echo "$*" | bc -l
}
