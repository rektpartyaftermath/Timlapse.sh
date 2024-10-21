echo compiling
# framerate per second
framerate=10
ffmpeg -framerate $framerate -pattern_type glob -i '*.png' -qscale 3 -ab 192k -r 30 video.mp4
