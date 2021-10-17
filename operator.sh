kubectl get -A --watch --output-watch-events configmap \
-o=custom-columns=type:type,name:object.metadata.name \
--no-headers | \
while read next; do
  NAME=$(echo $next | cut -d' ' -f2)
  EVENT=$(echo $next | cut -d' ' -f1)

  case $EVENT in
    ADDED)
      echo "$NAME was added."
    ;;
    DELETED)
      echo "$NAME was deleted"
    ;;
  esac
done