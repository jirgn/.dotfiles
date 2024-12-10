jwt_decode() {
  jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "$1"
}
