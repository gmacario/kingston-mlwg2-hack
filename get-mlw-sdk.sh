#!/bin/sh

MLW_SDK_EXE=MLW_SDK_4100_v1-1-0-0.exe
MLW_SDK_TAR=MLW_SDK_4100_v1.1.0.0.tar

[ ! -e ${MLW_SDK_EXE} ] && curl -O http://media.kingston.com/support/downloads/${MLW_SDK_EXE}
[ ! -e ${MLW_SDK_TAR} ] && unrar x ${MLW_SDK_EXE}
tar xvf ${MLW_SDK_TAR}

# EOF
