admo
====
Advertise Monetization

General Setup Guidelines:
--------------------------------
1. Create a github account at and mail your account to sam.coer@gmail.com for repository permission.
2. Goto 'Account settings -> SSH Keys' https://help.github.com/articles/generating-ssh-keys to generate SSH 
   keys and add it to your github account. 
3. Download git bash from http://git-scm.com/downloads and add git/bin to your system path.
4. Download maven from http://maven.apache.org/download.cgi and add maven bin directory path to your system path.
5. Create a directory for code, go to this directory in command line and give following command to checkout code
```
git clone git@github.com:samcoer/admo.git
If the above doesnt work try git clone https://github.com/samcoer/admo.git
```
6. Copy settings.xml from {REPO_HOME} to {MVN_HOME}/config
7. Get Eclipse and install m2eclipse plugin as desribed at http://eclipse.org/m2e/download/ 
8. Import project into eclipse by following import->existing maven project
9. Follow project/module specific guideline as given below for build and deployment related information.


admo-web
--------
This project is web module for website and all server side services and database interaction.

1. Goto admo-web project in your git checkout from command line and give following command
mvn eclipse:eclipse -Dwtpversion=2.0
2. Goto Eclipse and change java version in project facets to point to 1.6
3. Run on tomcat 6 by right click and run on server option.
4. To build war from command line issue following command at {REPO_HOME}/admo/admo-web
```
mvn clean install
```

admo-client-core
----------------
This module contains core logic to be shared across various desktop and mobile clients.





