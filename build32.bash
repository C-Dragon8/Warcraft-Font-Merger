VERSION=0.2.1-32bit

i686-w64-mingw32-g++ src/merge-otd.cpp src/iostream.cpp -Isrc/ -std=c++14 -O3 -static -o bin32/merge-otd.exe
strip bin32/merge-otd.exe

mkdir -p release
cd release


R=字体合并补全工具-简体中文标准字库-$VERSION

mkdir -p $R

cp ../script/link.url $R/主页-使用说明.url
cp ../script/fonts.url $R/获取更多字体.url
cp ../bin32/{otfccbuild,otfccdump,merge-otd}.exe $R/
cp ../script/comp.bat $R/补全.bat
cp ../script/merge.bat $R/合并.bat
cp ../script/merge+comp.bat $R/合并补全.bat
cp ../script/pack-zh.bat $R/打包.bat
cp ../font/SourceHanSansCN-Medium.ttf $R/cjk.ttf
cp ../font/NotoSans-SemiCondensedMedium.ttf $R/latin.ttf

7z a -mx -myx -ms=on WarFontMerger-SC2-$VERSION.7z $R/
rar a -ma5 -m5 -s $R.rar $R/