# Polices pour GeoServer

Les fichiers `.ttf` / `.ttc` placés ici sont chargés par GeoServer au démarrage
(montés dans `/opt/additional_fonts`). Ils servent aux étiquettes des styles SLD.

Ils ne sont **pas** versionnés : beaucoup de polices sont sous licence propriétaire
(c'est le cas de Segoe UI, la police par défaut de QGIS sous Windows).

Sous Windows, pour reprendre les polices utilisées par tes styles QGIS :

```powershell
Copy-Item C:\Windows\Fonts\segoeui*.ttf .\fonts\
docker compose restart geoserver
```

Sans police ici, GeoServer utilise sa police par défaut (les étiquettes s'affichent quand même).
