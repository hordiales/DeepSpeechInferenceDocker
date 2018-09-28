# input wav file
INPUT=$1
DBVALUE=53
AMP=0.3

cp $INPUT input.wav

# code from https://stackoverflow.com/questions/36074224/how-to-split-video-or-audio-by-silent-parts
ffmpeg -i input.wav -filter_complex "[0:a]silencedetect=n=-$DBVALUE dB:d=$AMP[outa]" -map [outa] -f s16le -y /dev/null |& F='-aq 70 -v warning' perl -ne 'INIT { $ss=0; $se=0; } if (/silence_start: (\S+)/) { $ss=$1; $ctr+=1; printf "ffmpeg -nostdin -i input.wav -ss %f -t %f $ENV{F} -y %03d.wav\n", $se, ($ss-$se), $ctr; } if (/silence_end: (\S+)/) { $se=$1; } END { printf "ffmpeg -nostdin -i input.wav -ss %f $ENV{F} -y %03d.wav\n", $se, $ctr+1; }' | bash -x

rm input.wav