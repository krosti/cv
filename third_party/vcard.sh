#! /bin/bash

source infos

echo "BEGIN:VCARD
VERSION:4.0
N:$SURNAME;$NAME;;;
FN:$NAME $SURNAME"
if [ -n "$ORG" ]; then
  echo "ORG:$ORG"
fi
if [ -n "$TITLE" ]; then
  echo "TITLE:$TITLE"
fi
if [ -n "$TELWORK" ]; then
  echo "TEL;TYPE=work,voice;VALUE=uri:tel:$TELWORK"
fi
echo "TEL;TYPE=home,voice;VALUE=uri:tel:$TELHOME"
if [ -n "$ADDRWORK" ]; then
  echo "ADR;TYPE=work;LABEL="$ADDRWORK\n$CITYWORK, $COUNTYWORK $CAPWORK\n$STATEWORK"
  :;;$ADDRWORK;$CITYWORK;$COUNTYWORK;$CAPWORK;$STATEWORK"
fi
echo "ADR;TYPE=home;LABEL="$ADDR\n$CITY, $COUNTY $CAP\n$STATE"
 :;;$ADDR;$CITY;$COUNTY;$CAP;$STATE
EMAIL:$MAIL"
echo "REV:20080424T195243Z
END:VCARD"
