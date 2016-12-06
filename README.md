# docker_compose_test

Ez a meglévő docker_test továbbfejlesztett változata ahol a célunk az, hogy volume-ok segítségével áthidaljuk 
a meglévő problémát (image-be "belegyógyított" `aron.php`).

A célunk az volt, hogy az előre "bedobozolt" php imaget ne kelljen leszármaztatni, hanem azt használva tudjuk 
futtatni az `aron.php`-t. Ezen felül persze a másik cél az, hogy ne kelljen az `aron.php` minden egyes módosítása után
újra buildelni az adott imageket.

##2 feladatunk volt:

### 1. docker-compose.yml létrehozása: 
Ezt megoldottuk az fdmtrade-ben levő átmásolásával. Ebből ki kellett törölni számos beállítást, a végső célunk az volt, hogy
legyen egy `data` containerünk ami volume-ok segítségével tárolja az `aron.php` fájlunkat, továbbá az `app` container (amit a "dobozos"
php image alapján hozunk létre) ugyanúgy elérje a `data` container tartalmát.

### 2. A "dobozos" php által használt default command felülírása:
A docker-compose referenciáját [https://docs.docker.com/compose/compose-file/](https://docs.docker.com/compose/compose-file/) böngészve találtunk egy "command" parancsot amivel felül
lehet bírálni a php image [https://hub.docker.com/_/php/](https://hub.docker.com/_/php/) által defaultnak megadott commandot. Itt megadtuk azt amit a korábbi docker_test
projecktben a Dockerfile utolsó sorában adtunk meg.

Ezek után elég egy `docker-compose up` parancsot futtatni és lefut a teljes kompozíció

Az output egy kicsit gány de ez a windowsos megoldásnak és a compose egyediségének köszönhető. Ideális esetben nem a compose által használt
consoleban szeretnénk a futás eredményét viszontlátni (hanem böngészőben, fájlban, etc).



Githubos integrálás lépések:

 * Githubon létrehozni egy új repositoryt README-vel
 * Lokálisan futtatni a gyökérkönyvtárban: `git init`
 * Hozzáadjuk a githubos repositoryt mint fő központi repo. A repo címét a github oldalán a "Clone and download" gombra kattintva írja ki:
   `git remote add origin https://github.com/ProgressiveAdvice/docker_compose_test.git`
 * Ellenőrizzük, hogy hozzáadta a távoli repot: `git remote -v` 
 * Nézünk egy helyi állapotot: `git status`
 * Hozzáadjuk az összes filet a commit "stagehez": `git add .`
 * Megnézzük, hogy valóban mindegyik bekerült-e a stagebe: `git status`
 * Commitoljuk: `git commit -m "Initial commit"`
 * Megnézzük, hogy a commit benne van-e a logban: `git log`
 * Lehúzzuk a távoli repo adatait (jelenleg ez csak egy üres README.MD): `git pull`
 * Rinyálni fog, hogy nincs beállítva az upstream (melyik távoli branch tartozik a lokális branches, esetünkben a masterhez). A git által kiírt parancsot bemásoljuk: 
   `git branch --set-upstream-to=origin/master master`
 * Újra lehúzzuk a központi repo tartalmát (README.MD-t): `git pull`
 * Hozzáadjuk ezt a file (info.txt) a repohoz. Mivel ezt folyamatosan írom éppen ezért minden egyes új begépelésnél ez bővülni fog: `git add info.txt`
 * Commitolunk: `git commit -m "Added more content to info.txt"`
 * Betoljuk a módosításokat a központi repoba: `git push origin master`