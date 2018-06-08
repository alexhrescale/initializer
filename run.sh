#!/bin/bash
set -e

INITIALIZER_DIR=$(dirname $0)

unset LD_LIBRARY_PATH
if [ ! -e $HOME/.nix-profile ]; then
    echo setting up nix...
    curl https://nixos.org/nix/install | sh
    echo '. $HOME/.nix-profile/etc/profile.d/nix.sh' >> $HOME/.bashrc
    echo '. $HOME/.nix-profile/etc/profile.d/nix.sh' >> $HOME/.bash_profile
else
    echo nix already installed
fi

SSH_TRASH_DIR=/tmp/ssh_trash
if [ ! -e $SSH_TRASH_DIR ]; then
    mkdir -p $SSH_TRASH_DIR
    echo setting up ssh keys...
    for sshmatch in $(find $HOME/ -name '_ssh*' 2>/dev/null); do
        if [[ -d $sshmatch ]]; then
            for sshfile in $sshmatch/*; do
                fname=$(basename $sshfile)
                if [ ! -e ${HOME}/.ssh/${fname} ]; then
                    mv $sshfile ${HOME}/.ssh/${fname}
                fi
            done
        elif [[ -f $sshmatch ]]; then
            if [[ $sshmatch == *.tar.gz ]]; then
                tar -xf $sshmatch --keep-old-files --directory $HOME/.ssh/ || true
            fi
        fi
        mv $sshmatch ${SSH_TRASH_DIR}/$(basename $sshmatch)-$(ls -l $SSH_TRASH_DIR|wc -l)
    done
    for pubkey in $(find $HOME/.ssh/ -name '*.pub' 2>/dev/null); do
        cat $pubkey >> $HOME/.ssh/authorized_keys
    done
else
    echo ssh keys already set up
fi

echo fixing bashrc and bash_profile...
for pfile in .bashrc .bash_profile; do
    backup_number=$(ls -1 ${HOME}/${pfile}*|wc -l)
    cp ${HOME}/${pfile} ${HOME}/${pfile}.${backup_number} 
    cat ${HOME}/${pfile}.${backup_number} |
        grep -v nix-profile |
	cat > ${HOME}/${pfile}
    echo 'function enable-nix() { unset LD_LIBRARY_PATH; . $HOME/.nix-profile/etc/profile.d/nix.sh; };' >> ${HOME}/${pfile}
done

. $HOME/.nix-profile/etc/profile.d/nix.sh
nix-channel --update
NIX_PACKAGES=$(cat <<EOF
emacs
firefox
git
go
graphviz
htop
imagemagick
jq
jsonnet
leiningen
lftp
lnav
mc
moreutils
nodejs-9.11.1
python2.7
python2.7-virtualenv
silver-searcher
singularity
tmux
vim
zsh
zeromq
zsh
EOF
)
nix-env -i $NIX_PACKAGES || true
  
echo 'set-option -g default-shell $HOME/.nix-profile/bin/zsh' > $HOME/.tmux.conf
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

# set up emacs
emacs -batch \
  --eval='(require '\''package)' \
  --eval='(package-initialize)' \
  --eval='(add-to-list '\''package-archives '\''("melpa" . "https://melpa.org/packages/") t)' \
  --eval='(package-refresh-contents)' \
  --eval="(dolist (package '(use-package magit projectile undo-tree ace-window expand-region restclient eval-in-repl)) (package-install package))" \
  --eval="(dolist (package '(cider paredit clj-refactor json-mode js2-mode python-mode yaml-mode)) (package-install package))" \
  --eval='(print "OK: packages installed")' 

virtualenv $HOME/nix_venv
source $HOME/nix_venv/bin/activate
pip install jupyter jupyterlab bash_kernel
jupyter labextension install jupyterlab-drawio
# hack due to broken dependency on libzmq somewhere in the zmq toolchain
cp $(find $HOME/.nix-profile/ -name 'libzmq.so'|head -1) $HOME/nix_venv/lib/libzmq.so.5
export LD_LIBRARY_PATH=$HOME/nix_venv/lib
python -m bash_kernel.install
