# JRE-Spotify-Download
A simple command line script to download Joe Rogan Experience episodes from Spotify in the highest quality.

# Which Version Should I Download?
See here: [https://github.com/Dot50Cal/JRE-Spotify-Download/blob/main/README.md#technical-details](https://github.com/Dot50Cal/JRE-Spotify-Download#technical-details)

# Requirements:

Aria2: https://github.com/aria2/aria2

FFMPEG: https://github.com/FFmpeg/FFmpeg

# Tutorial:

When ran, the script will prompt you for the audio "initialization" webm URL for the JRE video. To get this, load up the podcast episode page and use network tools (F12 in Chrome). 
1. Navigate to the Network tab.
2. Filter on "webm" without quotes (As of 12-23-2023, you should filter on "mp4").
3. Press the GREEN play button on the podcast episode page (this loads the video to play vs audio only), then pause the playback.
4. Copy the URL for the first webm (As of 12-23-2023, you should filter on "mp4") result without a number (there should be two, the first is audio, the second is video).

![Tutorial Image 1](https://i.imgur.com/7Pmg8Ac.jpg)

Next, the script will ask you what the end time code is on the video.
1. Click and drag the seek bar along the bottom of the page to the end of the podcast while it is paused.
2. Your network filters should show you a high numbered .webm URL. This number is the number you want to provide to the script.

![Tutorial Image 1](https://i.imgur.com/X0CwAzV.jpg)

Once this is done, the script has all it needs to kick off and download the podcast files, then combine them all into a single .webm with both audio and video. Once it is done combining into a final output (final_title.mp4), it will automatically delete all the temporary files it needed to create the final result. A huge thank you to reddit user stabbedbybrick who discovered this method here (https://www.reddit.com/r/Piracy/comments/zzvc0t/guide_how_to_download_spotify_podcast_videos/).

# Technical Details:

As of 12-23-2023, the scripts you should use are:

| Quality | JRE Script 1 | JRE Script 2 | JRE Script 3 | JRE Script 4 |
| :---    | ------------ | ------------ | --------     | --------     |
| Audio   | 23     | 19    | 20      | 15      |
| Video (320x100)		| N/A       | N/A      | N/A      | 13      |
| Video (426x240)		| N/A       | N/A      | N/A      | 12      |
| Video (640x480/568x320)     | 22       | 18      | 19      | 11      |
| Video (854x480/854x400)     | 21       | 17      | 18      | 10      |
| Video (1280x720)     | 20       | 16      | 17      | 9      |
| Video (1920x1080)     | 19       | 15      | 16      | 8      |
| When to use script | Works til #2038 (Trae Tha Truth) | Works til #149 (MMA Dan Henderson) | Works til #2054 (Elon Musk) | Current episodes |

12-23-2023 Update:

A few things have changed, most noticable is a switch to mp4 container's for the video/audio rather than webm. The 4th script has been updated. Also, there are some episodes that have video issues for the 1080p copy. The ones I noticed are 2055 Tim Kennedy, 2075 Protect Our Parks Part 1, and the last 2-3 minutes of the MMA 151 with Bo Nickal. I am not sure what has caused this but assume it is uncorrectable at this time and deferred to 720p copies for those episodes. This is why I included a specific 720p script this time. Its also become somewhat clearer that I believe Spotify is changing the quality #'s around in a programatic fasion to deter what we are doing here, or at least make it harder. I am hoping this ceases since it appears their infrastructure change is complete with the switch to mp4, but will keep monitoring for updates.

10-31-2023 Update:

Starting with MMA Show Podcast #149 (Dan Henderson), Spotify has changed quality #'s again, up by 1, so 16 is now 1920x1080 and Audio is 20. I've added a 3rd edition of the downloader to adjust for this. Note that the prior episode to this (Fight Companion October 21 2023) still follows script #2's formatting, but the 1280x720 version is uploaded twice. This means there is no 1920x1080 rip avaialble since the Youtube livestream is now private.

10-8-2023 Update:

Starting with podcast #2038 (Trae Tha Truth), and interspersed, Spotify has changed the "folders" that I outlined below. The mappings now go down starting from 19 (Audio stream only) down to 15 (1920x1080 video stream). As such, I've added a second JRE Download Bat file which will get these podcasts.


Original details:

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
