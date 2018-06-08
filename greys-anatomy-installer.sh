#!/bin/bash

VERSION=0.0.1

usage () {
  echo "greys-anatomy-installer [-hV]"
  echo
  echo "Options:"
  echo "  -h|--help      Print this help dialogue and exit"
  echo "  -V|--version   Print the current version and exit"
}

greys-anatomy-installer () {
  for opt in "${@}"; do
    case "$opt" in
      -h|--help)
        usage
        return 0
        ;;
      -V|--version)
        echo "$VERSION"
        return 0
        ;;
      install)
	mkdir ~/.greys-anatomy
	pushd ~/.greys-anatomy
	curl -sLk http://ompc.oss.aliyuncs.com/greys/install.sh| bash
	if ! grep -F '$HOME/.greys-anatomy' ~/.bashrc; then
		echo 'PATH=$HOME/.greys-anatomy:$PATH' >> ~/.bashrc
	fi
	popd
    esac
  done

  ## your code here
}

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
  export -f greys-anatomy-installer
else
  greys-anatomy-installer "${@}"
  exit $?
fi
