Project [DeepSpeech](https://github.com/mozilla/DeepSpeech]DeepSpeech) is an open source Speech-To-Text engine, using a model trained by machine learning techniques, based on Baidu's Deep Speech research paper. Project DeepSpeech uses Google's TensorFlow project to make the implementation easier.

This is a dockerfile to run inference with the pre-trained english model.

	Tested with DeepSpeech version: 0.2.0a8

# Usage

#### Build the image

	$ docker build -t deepspeech -f ./Dockerfile .

WARNING: English model is about 2.1 GB , get patient

#### Run the inference

	$ docker run -it --rm -v /your/path/audio-test-16k.wav:/audio.wav
	--entrypoint bash deepspeech

	(container)$ deepspeech --model /models/output_graph.pb --alphabet
	/models/alphabet.txt --lm /models/lm.binary --trie /models/trie
	--audio /audio.wav"


#### Log

	Loading model from file /models/output_graph.pb
	TensorFlow: v1.6.0-16-gc346f2c
	DeepSpeech: v0.2.0-alpha.8-0-gcd47560
	Warning: reading entire model file into memory. Transform model file
	into an mmapped graph to reduce heap usage.
	2018-09-27 21:04:02.711128: I
	tensorflow/core/platform/cpu_feature_guard.cc:140] Your CPU supports
	instructions that this TensorFlow binary was not compiled to use: AVX2
	FMA
	Loaded model in 2.9s.
	Loading language model from files /models/lm.binary /models/trie
	Loaded language model in 8.91s.
	Running inference.
	[RECOGNIZED-TEXT]
	Inference took 69.322s for 41.164s audio file.

