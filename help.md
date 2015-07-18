# load usb
sudo mount -t vfat /dev/sda1 . -o umask=0022,gid=pi,uid=pi

# ssh tunnel from any:2080 to any:80 from pi@31.33.165.211
ssh -L 2080:localhost:80 pi@31.33.165.211

# some words for fun
/usr/dict/ || /usr/share/dict/

# get disks infos
df -h

# rasp settings
sudo raspi-config

# ecouter un tty discretly
cat /dev/victim/tty | tee /dev/victim/tty

# know your public ip
curl ifconfig.me

# shutdown raspberry
sudo shutdown -h now
# or
sudo halt

# restart raspberry
sudo shutdown -r now
# or
sudo reboot

# minecraft server
java -Xmx512M -Xms512M -jar file.jar

# nossl google search ip
216.239.32.20

# do a proxy connection
nc -l 8082 0<backpipe | nc 216.239.32.20 80 1>backpipe

# metasploit
192.126.120.96 [445, 139]

# ecrire tant que l'on veux jusqu'a ecrire un pattern (EOF)
nc localhost 12345 << EOF

# faire tourner une commande en bg
$> cat
[ctrl-z]
$> bg
# ou
$> cat &

# jobs zsh
$> %number
[The job with the given number]
$> %string
[Any job whose command line begins with string]
$> %?string
[Any job whose command line contains string]
$> %%
[Current job]
$> %+
[Equivalent to %%]
$> %-
[Previous job]

# put a process in background + don't quit when shell exits
nohup command &

# loop over a set of files
for f (**/*.txt) { echo $f }

# globbing zsh http://www.linux-mag.com/id/1606/
# http://zsh.sourceforge.net/Intro/intro_2.html
# write in parenthsis what you want

# only directories
echo *(/)

/	Directories
.	Plain files
@	Symbolic links
*	Executable plain files (mode 0100)
r	Owner-readable (mode 0400)
w	Owner-writable (mode 0200)
x	for, sections, single
I	Group-writable (mode 0020)
E	Group-executable (mode 0010)
X	World-executable (mode 0001)
^	Negate all following qualifiers
