#! /bin/bash
set -eu

if [[ "$(basename "$(pwd)")" != "papirus-icon-theme" ]]; then
  exit 1
fi

rm -rf Papirus-Adapta Papirus-Adapta-Nokto
mkdir -p Papirus-Adapta Papirus-Adapta-Nokto
cp -R Papirus/* Papirus-Adapta/
cp -R Papirus-Dark/* Papirus-Adapta-Nokto/

sed -i "s/Name=Papirus/Name=Papirus-Adapta/g" \
  Papirus-Adapta/index.theme
sed -i "s/Name=Papirus-Dark/Name=Papirus-Adapta-Nokto/g" \
  Papirus-Adapta-Nokto/index.theme
sed -i "s/Comment=Papirus icon theme/Comment=Papirus icon theme for Adapta/g" \
  Papirus-Adapta/index.theme
sed -i "s/Comment=Papirus icon theme for dark themes/Comment=Papirus icon theme for Adapta Nokto/g" \
  Papirus-Adapta-Nokto/index.theme

rm Papirus-Adapta-Nokto/16x16/panel
ln -s ../../Papirus-Adapta/16x16/panel Papirus-Adapta-Nokto/16x16/panel

rm Papirus-Adapta-Nokto/22x22/places
rm Papirus-Adapta-Nokto/22x22/panel
ln -s ../../Papirus-Adapta/22x22/places Papirus-Adapta-Nokto/22x22/places
ln -s ../../Papirus-Adapta/22x22/panel Papirus-Adapta-Nokto/22x22/panel

rm Papirus-Adapta-Nokto/24x24/places
rm Papirus-Adapta-Nokto/24x24/panel
ln -s ../../Papirus-Adapta/24x24/places Papirus-Adapta-Nokto/24x24/places
ln -s ../../Papirus-Adapta/24x24/panel Papirus-Adapta-Nokto/24x24/panel

rm Papirus-Adapta-Nokto/32x32
ln -s ../Papirus-Adapta/32x32 Papirus-Adapta-Nokto/32x32

rm Papirus-Adapta-Nokto/48x48
ln -s ../Papirus-Adapta/48x48 Papirus-Adapta-Nokto/48x48

rm Papirus-Adapta-Nokto/64x64
ln -s ../Papirus-Adapta/64x64 Papirus-Adapta-Nokto/64x64

light=00b4cb
dark=00a2b4

find Papirus-Adapta Papirus-Adapta-Nokto \
  -type f -exec sed -i "s/#5294e2/#${light}/g" {} +
find Papirus-Adapta Papirus-Adapta-Nokto \
  -type f -exec sed -i "s/#4877b1/#${dark}/g" {} +
