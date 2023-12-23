setlocal enabledelayedexpansion

set /p AUDIOINIT="Audio Init URL: "
SET "VIDEOINIT=%AUDIOINIT:/profiles/15/=/profiles/9/%"
set "AUDIOTEMP=%AUDIOINIT:15/inits/=15/0.%"
set "VIDEOTEMP=%AUDIOINIT:15/inits/=9/0.%"
set /p END="End Time Code: "
set FINALAUDIO=!AUDIOTEMP:0.mp4=[0-%END%:4].mp4!
set FINALVIDEO=!VIDEOTEMP:0.mp4=[0-%END%:4].mp4!
curl -s "!AUDIOINIT!" -o inita.mp4
curl -s "!VIDEOINIT!" -o initb.mp4
aria2c -P -Z -d tmpaudio -o finalaudio.mp4 "!FINALAUDIO!"
cd tmpaudio
for /L %%i in (0,4,%END%) do type "%cd%\%%i.mp4" >> ..\audio_tmp.mp4
cd ..
aria2c -P -Z -d tmpvideo -o finalvideo.mp4 "!FINALVIDEO!"
cd tmpvideo
for /L %%i in (0,4,%END%) do type "%cd%\%%i.mp4" >> ..\video_tmp.mp4
cd ..
type inita.mp4 audio_tmp.mp4 > audio.mp4
type initb.mp4 video_tmp.mp4 > video.mp4
ffmpeg -hide_banner -i video.mp4 -i audio.mp4 -c copy final_title.mp4
del /f audio.mp4 video.mp4 audio_tmp.mp4 video_tmp.mp4 inita.mp4 initb.mp4
rmdir /Q /S tmpaudio
rmdir /Q /S tmpvideo
