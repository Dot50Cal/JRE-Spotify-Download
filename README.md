# JRE-Spotify-Download
A simple command line script to download Joe Rogan Experience episodes from Spotify in the highest quality.

# Requirements:

Aria2: https://github.com/aria2/aria2

FFMPEG: https://github.com/FFmpeg/FFmpeg

# Tutorial:

When ran, the script will prompt you for the audio "initialization" webm URL for the JRE video. To get this, load up the podcast episode page and use network tools (F12 in Chrome). 
1. Navigate to the Network tab.
2. Filter on "webm" without quotes.
3. Press the GREEN play button on the podcast episode page (this loads the video to play vs audio only), then pause the playback.
4. Copy the URL for the first webm result without a number (there should be two, the first is audio, the second is video).

![Tutorial Image 1](https://i.imgur.com/7Pmg8Ac.jpg)

Next, the script will ask you what the end time code is on the video.
1. Click and drag the seek bar along the bottom of the page to the end of the podcast while it is paused.
2. Your network filters should show you a high numbered .webm URL. This number is the number you want to provide to the script.

![Tutorial Image 1](https://i.imgur.com/X0CwAzV.jpg)

Once this is done, the script has all it needs to kick off and download the podcast files, then combine them all into a single .webm with both audio and video. Once it is done combining into a final output (final_title.webm), it will automatically delete all the temporary files it needed to create the final result. A huge thank you to reddit user stabbedbybrick who discovered this method here (https://www.reddit.com/r/Piracy/comments/zzvc0t/guide_how_to_download_spotify_podcast_videos/).

# Technical Details:

As of this writing, the podcast format's are in separate "folders". These folders contain a number that corresponds to the quality provided. This script forces the highest quality video (19) and the best audio (23). The qualities are explained below from my findings:

	23=Audio stream only
		Format                                   : WebM
		Format version                           : Version 4
		File size                                : 4.16 MiB
		Duration                                 : 6 min 44 s
		Overall bit rate                         : 86.3 kb/s
		Writing application                      : Lavf60.10.100
		Writing library                          : Lavf60.10.100
		
		Audio
		ID                                       : 1
		Format                                   : Opus
		Codec ID                                 : A_OPUS
		Duration                                 : 6 min 44 s
		Channel(s)                               : 2 channels
		Channel layout                           : L R
		Sampling rate                            : 48.0 kHz
		Bit depth                                : 32 bits
		Compression mode                         : Lossy
		Default                                  : Yes
		Forced                                   : No

	22=Video stream only, 640x360
		Format                                   : WebM
		Format version                           : Version 2
		File size                                : 28.1 MiB
		Duration                                 : 6 min 44 s
		Overall bit rate                         : 584 kb/s
		Writing application                      : Lavf60.10.100
		Writing library                          : Lavf60.10.100
		
		Video
		ID                                       : 1
		Format                                   : VP9
		Codec ID                                 : V_VP9
		Duration                                 : 6 min 44 s
		Bit rate                                 : 554 kb/s
		Width                                    : 640 pixels
		Height                                   : 360 pixels
		Display aspect ratio                     : 16:9
		Frame rate mode                          : Constant
		Frame rate                               : 29.970 (30000/1001) FPS
		Color space                              : YUV
		Bits/(Pixel*Frame)                       : 0.080
		Stream size                              : 26.7 MiB (95%)
		Default                                  : Yes
		Forced                                   : No
		Color range                              : Limited
		Color primaries                          : BT.709
		Transfer characteristics                 : BT.709
		Matrix coefficients                      : BT.709

	21=Video Stream only, 854x480
		Format                                   : WebM
		Format version                           : Version 2
		File size                                : 56.4 MiB
		Duration                                 : 6 min 44 s
		Overall bit rate                         : 1 171 kb/s
		Writing application                      : Lavf60.10.100
		Writing library                          : Lavf60.10.100
		
		Video
		ID                                       : 1
		Format                                   : VP9
		Codec ID                                 : V_VP9
		Duration                                 : 6 min 44 s
		Bit rate                                 : 1 117 kb/s
		Width                                    : 854 pixels
		Height                                   : 480 pixels
		Display aspect ratio                     : 16:9
		Frame rate mode                          : Constant
		Frame rate                               : 29.970 (30000/1001) FPS
		Color space                              : YUV
		Bits/(Pixel*Frame)                       : 0.091
		Stream size                              : 53.8 MiB (95%)
		Default                                  : Yes
		Forced                                   : No
		Color range                              : Limited
		Color primaries                          : BT.709
		Transfer characteristics                 : BT.709
		Matrix coefficients                      : BT.709

	20=Video Stream only, 1280x720
		Format                                   : WebM
		Format version                           : Version 2
		File size                                : 94.7 MiB
		Duration                                 : 6 min 44 s
		Overall bit rate                         : 1 966 kb/s
		Writing application                      : Lavf60.10.100
		Writing library                          : Lavf60.10.100
		
		Video
		ID                                       : 1
		Format                                   : VP9
		Codec ID                                 : V_VP9
		Duration                                 : 6 min 44 s
		Bit rate                                 : 1 882 kb/s
		Width                                    : 1 280 pixels
		Height                                   : 720 pixels
		Display aspect ratio                     : 16:9
		Frame rate mode                          : Constant
		Frame rate                               : 29.970 (30000/1001) FPS
		Color space                              : YUV
		Bits/(Pixel*Frame)                       : 0.068
		Stream size                              : 90.6 MiB (96%)
		Default                                  : Yes
		Forced                                   : No
		Color range                              : Limited
		Color primaries                          : BT.709
		Transfer characteristics                 : BT.709
		Matrix coefficients                      : BT.709

	19=Video Stream only, 1920x1080
		Format                                   : WebM
		Format version                           : Version 2
		File size                                : 142 MiB
		Duration                                 : 6 min 44 s
		Overall bit rate                         : 2 945 kb/s
		Writing application                      : Lavf60.10.100
		Writing library                          : Lavf60.10.100
		
		Video
		ID                                       : 1
		Format                                   : VP9
		Codec ID                                 : V_VP9
		Duration                                 : 6 min 44 s
		Bit rate                                 : 2 821 kb/s
		Width                                    : 1 920 pixels
		Height                                   : 1 080 pixels
		Display aspect ratio                     : 16:9
		Frame rate mode                          : Constant
		Frame rate                               : 29.970 (30000/1001) FPS
		Color space                              : YUV
		Bits/(Pixel*Frame)                       : 0.045
		Stream size                              : 136 MiB (96%)
		Default                                  : Yes
		Forced                                   : No
		Color range                              : Limited
		Color primaries                          : BT.709
		Transfer characteristics                 : BT.709
		Matrix coefficients                      : BT.709


# FAQ:

**Why use Aria?**

> Aria saves a lot of time when downloading large files, however in this instance it does not save a ton of time. This is due to the way Spotify chunks its files. It does save a little bit of time, maybe 20-30 seconds, but it is an improvement nonetheless.

**Will this remove DRM?**

> No, this does not work on DRM videos. JRE is specifically DRM Free so that is not necessary and outside the scope of this script.

**Why do this?**

> I like to archive things I am interested in. Some JRE guests interest me and I began to notice that when he switched to Spotify, some of his older podcasts did not make the transition. There was a large group effort to archive his older podcast, the majority of that was hosted on Odysee and Internet Archive, but recent takedowns have killed that project for the most part so I was forced to begin archiving them solo going forward. After finding the reddit post mentioned above, I developed this script to assist in making the download easier/quicker.

**Can I adapt the script to force audio only?**

> Sure, the information above should help aid you in that endeavor if you desire it.
