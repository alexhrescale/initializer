#!/bin/bash
####################################################################################################
#  ___  _   _ _____   ____   ___  _____ ____    _   _  ___ _____   ____ ___ __  __ ____  _  __   __#
# / _ \| \ | | ____| |  _ \ / _ \| ____/ ___|  | \ | |/ _ \_   _| / ___|_ _|  \/  |  _ \| | \ \ / /#
#| | | |  \| |  _|   | | | | | | |  _| \___ \  |  \| | | | || |   \___ \| || |\/| | |_) | |  \ V / #
#| |_| | |\  | |___  | |_| | |_| | |___ ___) | | |\  | |_| || |    ___) | || |  | |  __/| |___| |  #
# \___/|_| \_|_____| |____/ \___/|_____|____/  |_| \_|\___/ |_|   |____/___|_|  |_|_|   |_____|_|  #
#                                                                                                  #
#:os/::sN/:d/:y+:::hdm::::+Nd/::+N/:::ys/::oy/s-+h::my:::sMN::o`-+s/:::s-:h/:s://.o:.:- /...:o-:s.`#
#NNMMNMNmNNMMMNNMMMMMMNMMmmMMMMMMMMmyso+ossyNN/.odMMMMMMMMMMMMMMMMm+`   sMMMMMh               :NMMm#
#NNMMMNNNNMMMMNMMMNNMNNNMNNMMMNyy+.         -dh.  /dMMMMMMMMMMMMNs`     .NMNNm.             .odNNy:#
#MMMMNNNNMNNNNMNNmNNdmMMMNMMMm/`           ``.hd-  `-hMMMMMMMNNMd       `dmddh`            :yhhdmy:#
#MMMMNNNmNNNmNNNNMMNNMNNNyMMmN:              ``+m+  `.hNMMMMMMMhM/      `dmddy           `/s:``:/+o#
#MmNmNNmMmMNNNmNNNMNMMmMmdMMNh`               -/+dho/+:/NMMMMMMNMN.     `hmdds         `.+-        #
#mNMNmMMMNMMNNMNMNMNMMNNMdMMMy              ./::s++NNm/.hMMMMMMMMMo     `hmddy`       .+:`         #
#MMNNMMMMNMMMMNNNNMNMNNMmyMMMN:.   `      .yNNoydoss+.` +MMMMMMMMMm     `dmddy`     `/o-           #
#MMmmMMMNNNNMNNNNMNhdMNNMmMMMMNs::odh+:   -s-`          /MMMMMMMMMm     `dmddd.    +yho`           #
#NNMmNNMMMMNNMNMMMMMNMMNmmNMMMNydo-+.                  `hMMMMMMMMMMs`   `dmmdd+` -sy:`:/:-``       #
#MMMMMmNmMMNNNNMMMMMNMNNNNdMMMMh                      `smMMMMMMMMMMm-   .mmmddddhhhy: ++/:.--.---.`#
#MMMNNNNNMmNNmNmMNNMNMNmmNdNMMMM:              .      -y/hMMMMMMNMMN-:  .dmmdddddhho` `       `-+ss#
#NMMNNmmNMMMMMMMMMMMMMMMNhhmMNMMM+         `/hmd    `  ..sMMMMNNMMMmo:  .dmmmddhhdd.              /#
#MMMMMMMMMMMMMMMMMhoydmMMmyMMNMMMMs  `  `:oNMMMNmdmNm+ -+sMMMMNNMMMyds/ohNNNddhhhMd             `-y#
#MMMMMMMMMMMMMo. `      ``:.+ys/omN:   `.-+/.-:-:+o. `  ``smNy///NMMmyMMMMM:-````.`            `   #
#MMMMMMMMMMMMh             ``/s/msMN+ `///+``..`      ``-`dNhhsshMMMmMMMMMMNMMN+:.``  ..  `-.```   #
#MMMMMMMMMMMM-    `-.` `: . `.-:ohMMMd-..             ``ohmMmMmNdMMMMMMMMMMMMMMMMmo+--oho+o+-.`    #
#MMMMMMMMMMMy   `yNdmhyNhyh//o  -+NMMNdy:   ``        .yNMMNNMMMMMMMMMMMMMMMMMNMs/hNdhhhhhhs+/.    #
#MMMMMMMMMMm.   -yoo:/hMMMMdd:  ./yMMMmyd/.        `./mMMNmysmMMMMMMMMMMMMMMNdd/:yddddNNMMNNNNNdoo/#
#MMMMMMMMMMo     -////oyMMNhm`  ``yMMMNNNmh+.``.--:smNNNmds/::omddhMMMMMMMMmdy::ydyyydhdNMMNNMMMMNd#
#MMMMMMMMMoo    `:/-... `++:    `yNNMMNMMMMMNmmdNNMMMNmdh+--omy/ohdMMMMMMhsyo/+hs/ossyddNMMmNdyNMMN#
#MMMMMMMMm`/     .:.`          .ymNMMMMMMMdhNMNhMMMMMNdyyshMMNm.s+NhhMMms++/:sdms+sssohddNNmMsohMMM#
#MMMMMMMMM::     .:.         `:mMMMMMMMMMNshmmhmsMmMMdhNMNNmddo/hmMmNMms:-+ohdmMsosysyhNNNdNMyosNMM#
#MMMMMMy+ymddymyNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmyoydmmdyyNNMymh+shydNmdNdNNMMMNhdyshhdysssomMMMh/y#
###   ___ _   _ ____ _____  _    _     _       ____   _    ____ _  __    _    ____ _____ ____    ###
###  |_ _| \ | / ___|_   _|/ \  | |   | |     |  _ \ / \  / ___| |/ /   / \  / ___| ____/ ___|   ###
###   | ||  \| \___ \ | | / _ \ | |   | |     | |_) / _ \| |   | ' /   / _ \| |  _|  _| \___ \   ###
###   | || |\  |___) || |/ ___ \| |___| |___  |  __/ ___ \ |___| . \  / ___ \ |_| | |___ ___) |  ###
###  |___|_| \_|____/ |_/_/   \_\_____|_____| |_| /_/   \_\____|_|\_\/_/   \_\____|_____|____/   ###
###                                                                                              ###
####################################################################################################

set -e

if [ "$1" == "root" ]; then
    sudo -v
    PROOT_BINARY=
    sudo mkdir -p /etc/nix
    # fix from https://github.com/NixOS/nix/issues/2651
    echo 'sandbox = false' | sudo tee /etc/nix/nix.conf
else
    # note that running in proot may lead to mysterious failures; building
    # pycrypto in proot currently fails for example, due to
    # https://github.com/termux/proot/issues/25
    #
    # this is normally necessary to get this to run, but may be bad practice
    echo setting PROOT_NO_SECCOMP=1
    sleep 2
    PROOT_NO_SECCOMP=1
    PROOT_BINARY=$HOME/proot
fi

if [ "x" != "x${PROOT_BINARY}" ]; then
    CUSTOM_ROOT=$HOME/.nix-root
    NIX_DIR=$HOME/.nix-root/nix
    NIX_ETC_CONF=$HOME/.nix-root/etc/nix/nix.conf

    echo Using proot at $PROOT_BINARY with nix directory in $NIX_DIR
    # https://nixos.wiki/wiki/Nix_Installation_Guide#PRoot
    # https://github.com/proot-me/proot-static-build
    # https://github.com/proot-me/PRoot/issues/133#issuecomment-357781130

    PROOT_RELEASE_URL=https://github.com/proot-me/proot-static-build/releases/download/v5.1.1/proot_5.1.1_x86_64_rc2

    PROOT_COMMAND="$PROOT_BINARY -b $NIX_DIR:/nix -b $(dirname $NIX_ETC_CONF):/etc/nix bash"

    if [ ! -e $PROOT_BINARY ]; then
        wget -O $PROOT_BINARY $PROOT_RELEASE_URL
        chmod +x $PROOT_BINARY
    fi
    if [ ! -e $NIX_DIR ]; then
        mkdir -p $NIX_DIR
    fi
    if [ ! -e $NIX_ETC_CONF ]; then
        mkdir -p $(dirname $NIX_ETC_CONF)
        echo 'sandbox = false' > $NIX_ETC_CONF
    fi
    function run() {
        $PROOT_COMMAND "$@"
    }
else
    function run() {
        bash "$@"
    }
fi

INITIALIZER_DIR=$(dirname $0)

run <<'EOF_WRAPPER_A'

unset LD_LIBRARY_PATH
if [ ! -e $HOME/.nix-profile ]; then
    echo setting up nix...
    curl https://nixos.org/nix/install | sh
    echo '. $HOME/.nix-profile/etc/profile.d/nix.sh' >> $HOME/.bashrc
    echo '. $HOME/.nix-profile/etc/profile.d/nix.sh' >> $HOME/.bash_profile
else
    echo nix already installed: $(which nix-env)
fi

. $HOME/.nix-profile/etc/profile.d/nix.sh

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

# we need to fix the profile files due to LD_LIBRARY_PATH having
# conflicts with nix.
# fix profiles for nix first, so we can log in and start working
echo fixing bashrc and bash_profile for nix...
for pfile in .bashrc .bash_profile; do
    backup_number=$(ls -1 ${HOME}/${pfile}*|wc -l)
    cp ${HOME}/${pfile} ${HOME}/${pfile}.${backup_number} 
    cat ${HOME}/${pfile}.${backup_number} |
        grep -v nix-profile |
        grep -v nix-venv-shell |
    cat > ${HOME}/${pfile}
    echo 'function nix-enable() { unset LD_LIBRARY_PATH; . $HOME/.nix-profile/etc/profile.d/nix.sh; $* };' >> ${HOME}/${pfile}
done

nix-channel --update
NIX_PYTHON_PACKAGES=(python37Full python37Packages.lxml python37Packages.pyzmq python37Packages.pip python37Packages.numpy python37Packages.pandas python37Packages.matplotlib)
NIX_PACKAGES=$(cat <<EOF
emacs
fasd
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
libffi
libssh2
lnav
mc
moreutils
nodejs-10_x
openssl
${NIX_PYTHON_PACKAGES[@]}
ripgrep
singularity
tigervnc
tmux
vim
zeromq
zlib
zsh
EOF
)
nix-env -f '<nixpkgs>' -iA $NIX_PACKAGES || true

# set zsh default
echo 'set-option -g default-shell $HOME/.nix-profile/bin/zsh' > $HOME/.tmux.conf
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

# set up emacs
emacs -batch \
  --eval='(require '\''package)' \
  --eval='(package-initialize)' \
  --eval='(add-to-list '\''package-archives '\''("melpa" . "https://melpa.org/packages/") t)' \
  --eval='(package-refresh-contents)' \
  --eval="(dolist (package '(use-package magit projectile undo-tree ace-window expand-region restclient eval-in-repl)) (package-install package))" \
  --eval="(dolist (package '(${NIX_EMACS_PACKAGES[@]})) (package-install package))" \
  --eval='(print "OK: packages installed")' &


# set up jupyterlab
# attempting to build directly from pip causes all sorts of problems
# because pip tries to use system packages which aren't working and
# are unaware of nix.
# NOTE the SOURCE_DATE_EPOCH hack addresses this farce:
# '"ZIP does not support timestamps before 1980" when installing wheel'
# detailed in https://github.com/garbas/pypi2nix/issues/18
CMD=$(cat <<'EOF'
python -m venv $HOME/nix_venv;
source $HOME/nix_venv/bin/activate;
export SOURCE_DATE_EPOCH=$(date +%s);
# requires libssh2 in the env
pip install parallel-ssh;
# as of 2019-03-04 there are problems running with tornado 6;
# symptoms: cannot execute cells, cannot run console in jupyter
pip install 'tornado<6' jupyter jupyterlab bash_kernel;
python -m bash_kernel.install;
jupyter labextension install jupyterlab-drawio;
# jupyter nbextensions
pip install jupyter_contrib_nbextensions;
jupyter contrib nbextension install --user;
jupyter nbextensions_configurator enable --user;
EOF
)
nix-shell -p ${NIX_PYTHON_PACKAGES[@]} --run "$CMD" &

for pfile in .bashrc .bash_profile; do
    cat >> ${HOME}/${pfile} <<EOF
if [ -x "\$(command -v fasd)" ]; then eval "\$(fasd --init auto)"; alias z='fasd_cd -d'; fi
function nix-venv-shell() { nix-enable; CMD='bash -c ". \$HOME/nix_venv/bin/activate; '\$@'"'; nix-shell -p ${NIX_PYTHON_PACKAGES[@]} --run "\$CMD"; }
EOF
done

EOF_WRAPPER_A

if [ "x" != "x${PROOT_BINARY}" ]; then
    # FIXME this uglily overwrites the earlier nix-enable()
    for pfile in .bashrc .bash_profile; do
        echo "function nix-enable() { unset LD_LIBRARY_PATH; $PROOT_COMMAND --rcfile $HOME/.nix-profile/etc/profile.d/nix.sh; };" >> ${HOME}/${pfile}
    done
fi

