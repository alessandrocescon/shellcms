#!/bin/bash
source ./params.sh
echo "Content-type: text/html"
echo ""

echo '<html lang="it">'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<meta name="description" content="_description_">' | sed "s/_description_/$description/"
echo '<meta name="keywords" content="_keywords_">'  | sed "s/_keywords_/$keywords/"
echo '<meta name="author" content="_author_">'  | sed "s/_author_/$author/"
echo '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
echo '<meta name="robots" content="index,follow">'
echo '<meta name="google-site-verification" content="kc6wdFmkpA3GkXi2pdfxUh8wpbLxDZrBvbOw0Qhoum0" />'
echo '<meta property="og:title" content="_title_">' | sed "s/_title_/$title/"
echo '<meta property="og:description" content="_description_">' | sed "s/_description_/$description/"
echo '<meta property="og:image" content="_socimage_">' | sed "s/_socimage_/$socimage/"
echo '<meta property="og:url" content="_socurl_">' | sed "s/_socurl_/$socurl/"
echo '<meta name="twitter:card" content="summary_large_image">'
echo '<link rel="icon" type="image/png" href="/public/icon.png" />'
echo '<title>_title_</title>' | sed "s/_title_/$title/"
echo '<style>_style_</style>' | sed "s/_style_/$style/"
echo '<script>_script_</script>' | sed "s/_script_/$script/" 
echo '</head>'
echo '<body>' 
echo '<div id="cont">'
echo '<div id="website">'$header'</div>'
echo '<h1>'$title'</h1>'
echo '_content_ '| sed "s/_content_/$content/"
echo '</div>' 
echo '<div id="menu">'
echo '<ul id="menuul">'
echo '<li><a id="toggler" href="#" title="toggle menu" onclick="togglemenu()">[+]</a></li>'
#list files in directory and create menu
for entry in ./*_fold
do
  if test -d "$entry"; then
    echo '<div class="menutit">'
    echo $entry | sed 's/^.\///;s/_fold$//'
    echo '</div>'
    for entryb in "$entry"/*.sh
    do
      if test -f "$entryb"; then
        echo -n '<li><a href="'"$domain"'/'
        echo -n "$entryb" | sed "s/^.\///;s/.sh$//;"
        echo -n '.html">'
        entryrem=$(echo "$entry" | sed 's;/;\\/;g')
        echo -n $entryb | sed "s/^$entryrem\///" | sed "s/.sh$//;" 
        echo '</a></li>'
      fi
    done
  fi
  for entrys in $entry/*_fold
  do
    if test -d "$entrys"; then
      echo '<div class="submenutit">'
      echo $entrys | sed 's/.*\///' | sed 's/_fold$//'
      echo '</div>'
      for entryc in "$entrys"/*.sh
      do
        if test -f "$entryc"; then
          echo -n '<li class="submenuli"><a href="'"$domain"'/'
          echo -n "$entryc" | sed "s/^.\///;s/.sh$//;"
          echo -n '.html">'
          entryrem=$(echo "$entrys" | sed 's;/;\\/;g')
          echo -n $entryc | sed "s/^$entryrem\///" | sed "s/.sh$//;" 
          echo '</a></li>'
        fi
      done
    fi
  done
done
#list files in directory and create menu
echo '</ul>'
echo '</div>'
echo '<div id="footer">'
echo "$footer"
echo '</div>'
echo '</body>'
echo '</html>'

exit 0