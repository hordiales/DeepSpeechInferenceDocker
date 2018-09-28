FROM gcr.io/google_containers/ubuntu-slim:0.6
# Runs inference without GPU support
# Usage:
#        $ docker build -t deepspeech-inference .
#        $ docker run -it --rm -v /your/path/models:/models -v /your/path/audio/input_audio_16k.wav:/audio.wav deepspeech-inference

# Get basic packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        wget \
        python3 \
        python3-pip \
        libsox-dev

RUN pip3 install --upgrade pip

RUN pip3 install six
# Working version: 0.2.0a8 
RUN pip3 install deepspeech==0.2.0a8

# (optional) Download english model
# RUN wget -O - https://github.com/mozilla/DeepSpeech/releases/download/v0.2.0/deepspeech-0.2.0-models.tar.gz | tar xvfz -
# ADD DeepSpeech/models /models

# (optional) ffmpeg to build mono and 16kHz wav files
# RUN apt-get install -y ffmpeg
# ADD compatible_wav.sh /compatible_wav.sh

# CMD ["deepspeech", "--model", "/models/output_graph.pb", "--alphabet", "/models/alphabet.txt", "--lm", "/models/lm.binary", "--trie", "/models/trie", "--audio", "/audio.wav" ]
ENTRYPOINT ["deepspeech", "--model", "/models/output_graph.pb", "--alphabet", "/models/alphabet.txt", "--lm", "/models/lm.binary", "--trie", "/models/trie", "--audio", "/audio.wav" ]
