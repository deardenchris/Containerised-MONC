#### Install commonly used editors
apt-get install -q -y leafpad vim-gtk emacs
# Set the default editor in .profile
echo "export EDITOR=leafpad" >>.profile

apt-get install -q -y curl

#### Install FCM dependencies & configuration
apt-get install -q -y subversion firefox cvs tkcvs tk libxml-parser-perl
apt-get install -q -y m4 libconfig-inifiles-perl libdbi-perl g++ libsvn-perl
apt-get install -q -y xxdiff

#### Install Cylc dependencies & configuration
apt-get install -q -y graphviz python-jinja2 python-pygraphviz python-gtk2 sqlite3
apt-get install -q -y pep8 # used by test-battery
apt-get install -q -y tex4ht imagemagick texlive-generic-extra texlive-latex-extra texlive-fonts-recommended
# Ensure "hostname -f" returns the fully qualified name
perl -pi -e 's/localhost localhost.localdomain/localhost.localdomain localhost/;' /etc/hosts

# Add the Cylc wrapper scripts
cd /usr/local/bin
ln -sf cylc gcylc

#### Install Rose dependencies & configuration
apt-get install -q -y gfortran # gfortran is used in the brief tour suite
apt-get install -q -y python-pip pcregrep
apt-get install -q -y lxterminal # rose edit is configured to use this
apt-get install -q -y tidy
apt-get install -q -y python-requests python-simplejson
apt-get install -q -y python-virtualenv latexmk # needed by rose make-docs
pip install mock pytest-tap # used by test-battery
# Add the Rose wrapper scripts
cd /usr/local/bin
ln -sf rose rosie

#### Install latest versions of FCM, Cylc & Rose 
/usr/local/bin/install-latest-versions

#### Configure rose bush & rosie web services (with a local rosie repository)
apt-get install -q -y apache2 libapache2-mod-wsgi python-cherrypy3 apache2-utils python-sqlalchemy
apt-get install -q -y libapache2-mod-svn

