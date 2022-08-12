url="$1"

# zotero translator server must be open first with ?
# use translator to get Zotero API JSON for URL
zjson=$(curl -d "$1"   -H 'Content-Type: text/plain' http://127.0.0.1:1969/web)
echo $zjson > temp1.json

# convert this JSON to supported import format, eg. Bibtex
bib=$(curl -d @temp1.json -H 'Content-Type: application/json' 'http://127.0.0.1:1969/export?format=bibtex')
echo $bib > temp2.json