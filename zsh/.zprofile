# Only things that should run once per login

# If landed in Windows home (i.e., under /mnt/c/Users), redirect to Linux home
if [[ "$PWD" != "/home/"* ]]; then
  cd ~
fi


# WSL-specific example: make sure /usr/local/bin is early
export PATH=/usr/local/bin:/usr/bin:/bin:$PATH

