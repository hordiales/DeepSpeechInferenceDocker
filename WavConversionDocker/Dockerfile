FROM gcr.io/google_containers/ubuntu-slim:0.6
# Converts wav to 
# Usage:
#        $ docker build -t wav16kconverter .
#        $ docker run -it --rm -v $PWD/files:/files wav16kconverter -i /files/input_audio.m4a

# Get basic packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg

ENTRYPOINT [ "ffmpeg", "-ar", "16000", "-af", "aformat=s16:16000", "-ac", "1", "files/output.wav"]
