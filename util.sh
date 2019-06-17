looped-command-runner() {
	RUNNER_FILE=${1-runner.sh}
	HISTORY_FILE=${2-command-history.sh}
	INTERVAL=${3-2}
    touch $RUNNER_FILE
    touch $HISTORY_FILE
    _oldhash=
    _count=0
    while [ -e $RUNNER_FILE ]; do
        _newhash=$(md5sum $RUNNER_FILE)
        if [ "$_oldhash" != "$_newhash" ]; then
            (
                bash $RUNNER_FILE
            );
            if [ $? -eq 0 ]; then
                _count=$(($_count + 1))
                echo '# '$(printf "%03d" $_count)' '$(date +%F" "%T) >> $HISTORY_FILE
                cat $RUNNER_FILE >> $HISTORY_FILE
                truncate -s 0 $RUNNER_FILE
            fi
            _oldhash=$_newhash
        fi
        sleep $INTERVAL
    done
}

