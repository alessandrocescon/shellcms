#!/bin/bash
#dati base
root="/var/www/html/cmsshell/cgi-bin"
domain="https://www.eyefly.it"
title="shellcms un nuovo cms in puro scripting bash shell"
header="<a href="$domain" title='$title'>@eyefly.it <img class='headimg' src='/public/icon.png' /></a>"
footer="2020 © EYEFLY.IT - Tutti i diritti riservati - scrivimi: info@eyefly.it"
author="Alessandro Cescon info@eyefly.it"
style="body {font-family: Arial, Helvetica, sans-serif; text-align: justify; background-color:#222222;color:#ffffff; } \
a {text-decoration:none; color:#e0e0e0;} \
#menu ul li a#toggler {font-size:1.2em;} \
.headimg {width:1.2em; } \
.menutit {color: #000000;background: #ffffff;text-transform: uppercase;font-weight: bold;display: inline;}\
.submenutit {color: #000000;background: #ffffff;text-transform: uppercase;font-weight: bold;display: inline;margin-left:2.5em;}\
#menu ul li.submenuli {margin-left:2.5em;}\
#website {font-size: 2.0em;font-weight: bold;height:2.0em;line-height:2.0em;color: #ffffff;width: 7em;background-color: #000000;text-align: center;display: block;margin: auto;}\
#menu {position: fixed; top: 0px; left: 0px; height: 2em; background-color: #000000; display: block; width: 100%; } \
#menu ul{padding:0px; margin:0px; background-color: #000000; overflow:hidden; height:2em; } \
#menu ul li{list-style: none; height:2em; line-height:2em; margin-left:1.5em; } \
#menu ul li a{font-weight:bold; font-size:1.0em; color:#ffffff; } \
#cont {margin-top:3em; margin-bottom:1em; } \
#footer {background-color: #000000; display: block; width: 100%; color:#ffffff; text-align: center; line-height: 1.2em;font-size: 1.0em;clear: both;clear:both; }"
script="function togglemenu() {\
  var state = document.getElementById('toggler').innerText;\
  if(state == '[+]') {\
    document.getElementById('toggler').innerText='[-]';\
    document.getElementById('menuul').style.height = 'auto';\
  }\
  else {\
    document.getElementById('toggler').innerText='[+]';\
    document.getElementById('menuul').style.height = '2.0em';\
  }\
}"
#recupera path e contenuti in base a path
furl=$(echo "$REQUEST_URI" | sed "s/.html$//;")
#echo "$entryb" | sed "s/^.\///;s/.sh$//;"
vload="$DOCUMENT_ROOT/cgi-bin$furl.sh"
clru=$(echo "$REQUEST_URI" | sed "s/^\///;")
if [ -f "$vload" ]; then
    source "$vload"
else 
    #contenuti error 404
    title="errore pagina "$clru".html non trovata"
    description="errore pagina "$clru".html non trovata"
    keywords="errore pagina "$clru".html non trovata"
    content="<p>errore pagina "$clru".html non trovata</p>"
    socurl=$(echo "https://$SERVER_NAME$REQUEST_URI" | sed 's;/;\\/;g')
    socimage=""
fi
if [ -z "$clru" ]; then
   #contenuti home page
   title="shellcms un nuovo cms in puro scripting bash shell"
   description="shellcms è un nuovo tipo di cms nato per sperimentare l'estrema semplicità. Tutto basato su shell e tool a riga di comando"
   keywords="cms shell"
   content="<p>shellcmsTESTOjhjh</p>"
   socurl=$(echo "https://$SERVER_NAME$REQUEST_URI" | sed 's;/;\\/;g')
   socimage=""
fi
#output formattato
title=$(echo "$title" | sed 's;/;\\/;g')
description=$(echo "$description" | sed 's;/;\\/;g')
keywords=$(echo "$keywords" | sed 's;/;\\/;g')
socimage=$(echo "https://$SERVER_NAME/public/$socimageurl" | sed 's;/;\\/;g')
socurl=$(echo "https://$SERVER_NAME$REQUEST_URI" | sed 's;/;\\/;g')
content=$(echo "$content" | sed 's;/;\\/;g')