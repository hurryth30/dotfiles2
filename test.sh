if [ $SHELL != /usr/bin/zsh ] && [ $SHELL != /bin/zsh ]; then
    echo $SHELL
fi


DATE=`date '+%Y-%m-%d'`
echo $DATE > updated_time.txt

if [ `cat updated_time.txt` = $DATE ]; then
    echo 'same'
fi
