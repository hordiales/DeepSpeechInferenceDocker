# Usage:

#### Build docker image

    $ docker build -t wav16kconverter .


#### Convert

Converts files/input_audio.m4a into a new wav file 16 bits, mono, 16kHz named as files/output.wav 

    $ docker run -it --rm -v $PWD/files:/files wav16kconverter -i /files/input_audio.m4a
