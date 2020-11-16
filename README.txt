Shell scripts for setting up a Soup Hub computer:

* https://souphub.org.nz/

Overview: 
1) Install Ubuntu
2) Download Souphub scripts
3) Run souphubsetup.sh


1) Ubuntu Install: 

This is based on Ubuntu 16.04 Desktop installer.  

The user being set up is the admin user.  Clients will use the guest login set up below. 

* computer's name should be souphub#, where # is the next number after the maximum number used to date (e.g. souphub6) 

* user should be Soup Hub 

* username should be hubadmin 

* ask John what the password should be 

* keyboard US

* location Wellington (type this in) (or accept the Auckland default)

2) SoupHub Scripts

Run the following after installer is finished: 

sudo apt-get install git
mkdir SouphubSetup 
cd SouphubSetup
git clone https://github.com/souphub/scripts.git

3) Run souphubsetup.sh

cd scripts
./souphubsetup.sh 

Try to keep the script idempotent.  Currently it is ok to run the script repeatedly.

TODO: Test how the script doesn't work on Ubuntu 20.04. 
