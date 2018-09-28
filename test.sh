# use input with full path
INPUT=$1
docker run -it --rm -v $PWD/../DeepSpeech/models:/models -v $INPUT:/audio.wav deepspeech-inference

