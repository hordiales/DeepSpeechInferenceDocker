FROM gcr.io/google_containers/ubuntu-slim:0.6
# Usage:
#        $ docker build -t deepspeech-inference -f ./Dockerfile .
#        $ docker run -it --rm -v /local/path/to/your/audio/input-audio.wav:/audio.wav deepspeech-inference

# Example: $ docker run -it --rm -v $PWD/audio-test-16k.wav:/audio.wav deepspeech-inference
# Or:
#    $ docker run -it --rm -v /your/path/audio-test-16k.wav:/audio.wav --entrypoint bash deepspeech-inference
#    $ 
#    (container)$ deepspeech --model /models/output_graph.pb --alphabet /models/alphabet.txt --lm /models/lm.binary --trie /models/trie --audio /audio.wav"

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

CMD ["deepspeech --model /models/output_graph.pb --alphabet /models/alphabet.txt --lm /models/lm.binary --trie /models/trie --audio /audio.wav" ]
