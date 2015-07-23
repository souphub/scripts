Setting up a souphub computer:

Overview: 
1) Install Ubuntu
2) Download Souphub scripts
3) Run souphubsetup.sh


1) Ubuntu Install: 

The user being set up is the admin user.  Clients will use the guest login set up below. 

* computer's name should be souphub#, where # is the next number after the maximum number used to date (e.g. souphub6) 

* user should be Soup Hub 

* username should be hubadmin 

* ask John what the password should be 

* keyboard US

* location Wellington (type this in) (or accept the Auckland default)

2) SoupHub Scripts

run the following: 

sudo apt-get install git
mkdir SouphubSetup 
cd SouphubSetup
git clone https://github.com/souphub/scripts.git

3) Run souphubsetup.sh

cd scripts
./souphubsetup.sh 

Try to keep the script idempotent.  Currently ok to run it over and over. 
