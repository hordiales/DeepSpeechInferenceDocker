INPUT=$1
OUTPUT=$2
ffmpeg -i $INPUT -ar 16000 -af aformat=s16:16000 -ac 1 $OUTPUT
