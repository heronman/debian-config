#!/bin/bash
### Download, repack with dependencies fix, and install the specified version of Slack
set -e

VERSION=$1
TMPDIR=/tmp/tmp-install-slack

echo Preparing working dir
rm -rf ${TMPDIR}
mkdir -p ${TMPDIR}

echo Downloading package
wget https://downloads.slack-edge.com/releases/linux/${VERSION}/prod/x64/slack-desktop-${VERSION}-amd64.deb -O ${TMPDIR}/slack-desktop-${VERSION}-amd64.deb

echo Unpacking...
dpkg-deb -x ${TMPDIR}/slack-desktop-${VERSION}-amd64.deb ${TMPDIR}/unpack
echo Unpacking control file...
dpkg-deb --control ${TMPDIR}/slack-desktop-${VERSION}-amd64.deb ${TMPDIR}/unpack/DEBIAN
echo updating dependencies...
sed -i "s/libappindicator3-1/libayatana-appindicator3-1/" ${TMPDIR}/unpack/DEBIAN/control
echo Packing...
dpkg -b ${TMPDIR}/unpack ${TMPDIR}/slack-desktop-${VERSION}-p1-amd64.deb

echo Installing...
sudo apt install ${TMPDIR}/slack-desktop-${VERSION}-p1-amd64.deb

rm -rf ${TMPDIR}
