# BASH
###### count num of lines in a folder: 
`find -type f -exec wc -l {} + | tail -n 1`

Example to count for specific extensions:

`find -type f \( -name "*.asm" -o -name "*.h" \) -exec wc -l {} + | tail -n 1`

---

# FFMPEG 
###### Convert mp4 to mp3

```
ffmpeg -i input.mp4 -vn -acodec libmp3lame -b:a 192k output.mp3
```
> `-b:a 192k` sets bitrate.

###### For highest quality:
```
ffmpeg -i input.mp4 -vn -acodec libmp3lame -q:a 0 output.mp3
```

###### mkv to mp4 
```
ffmpeg -i input.mkv -acodec aac -vcodec libx264 output.mp4
```

###### to replace black with a select color
```
ffmpeg -i GREY_HD.gif -filter_complex \
"[0:v]format=rgba,geq=\
r='if(lt(r(X,Y),20)*lt(g(X,Y),20)*lt(b(X,Y),20),58,r(X,Y))':\
g='if(lt(r(X,Y),20)*lt(g(X,Y),20)*lt(b(X,Y),20),45,g(X,Y))':\
b='if(lt(r(X,Y),20)*lt(g(X,Y),20)*lt(b(X,Y),20),34,b(X,Y))':\
a='alpha(X,Y)',split[a][b];[b]palettegen[p];[a][p]paletteuse" \
output2.gif
```
