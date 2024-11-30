# Exports

export CURL_SSL_BACKEND=secure-transport
export GPG_TTY=$(tty)
export PGHOST="localhost"
export PYTHONSTARTUP=~/.pythonrc

if [[ `which brew` != "" ]]
then

export HOMEBREW_NO_AUTO_UPDATE=1

fi
