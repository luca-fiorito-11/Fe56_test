#!/bin/bash

ENDF=$1
MAT=$(sed -n '2,2 p' $ENDF | cut -c67-70 | xargs)

cat > input <<EOF
moder
20 -21
reconr
-21 -22 /
'' /
$MAT 0 0 /
0.01 0. /
0/
broadr
-21 -22 -23 /
$MAT 1 0 0 0. /
0.01 /
293.6 /
0/
moder
-23 30
stop
EOF

ln -sf $ENDF tape20
njoy < input
