setlocal enabledelayedexpansion

set /p AUDIOINIT="Audio Init URL: "
SET "VIDEOINIT=%AUDIOINIT:/profiles/19/=/profiles/15/%"
set "AUDIOTEMP=%AUDIOINIT:19/inits/=19/0.%"
set "VIDEOTEMP=%AUDIOINIT:19/inits/=15/0.%"
set /p END="End Time Code: "
set FINALAUDIO=!AUDIOTEMP:0.webm=[0-%END%:4].webm!
set FINALVIDEO=!VIDEOTEMP:0.webm=[0-%END%:4].webm!
curl -s "!AUDIOINIT!" -o inita.webm
curl -s "!VIDEOINIT!" -o initb.webm
aria2c -P -Z -d tmpaudio -o finalaudio.webm "!FINALAUDIO!"
cd tmpaudio
for /L %%i in (0,4,%END%) do type "%cd%\%%i.webm" >> ..\audio_tmp.webm
cd ..
aria2c -P -Z -d tmpvideo -o finalvideo.webm "!FINALVIDEO!"
cd tmpvideo
for /L %%i in (0,4,%END%) do type "%cd%\%%i.webm" >> ..\video_tmp.webm
cd ..
type inita.webm audio_tmp.webm > audio.webm
type initb.webm video_tmp.webm > video.webm
ffmpeg -hide_banner -i video.webm -i audio.webm -c copy final_title.mkv
del /f audio.webm video.webm audio_tmp.webm video_tmp.webm inita.webm initb.webm
rmdir /Q /S tmpaudio
rmdir /Q /S tmpvideo
