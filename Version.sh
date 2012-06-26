#!/bin/sh

GIT_BRANCH="master"

VERSION_FILE="${PROJECT_DIR}/Version.h"

SVN_DIR="${PROJECT_DIR}/.svn"
GIT_DIR="${PROJECT_DIR}/.git"

if [ -d "${GIT_DIR}" ]; then
	BUILD_NUMBER=`xcrun git rev-list ${GIT_BRANCH} | wc -l`
	BUILD_HASH=`xcrun git rev-parse --short --verify ${GIT_BRANCH}`
elif [ -d "${SVN_DIR}" ]; then
	BUILD_NUMBER=`xcrun svnversion -nc "${PROJECT_DIR}" | /usr/bin/sed -e 's/^[^:]*://;s/[A-Za-z]//'`
	BUILD_HASH="${BUILD_NUMBER}"
else 
	BUILD_NUMBER="1"
	BUILD_HASH="1"
fi

echo "#define BUILD_NUMBER ${BUILD_NUMBER}" > ${VERSION_FILE}
echo "#define BUILD_HASH @\"${BUILD_HASH}\"" >> ${VERSION_FILE}
