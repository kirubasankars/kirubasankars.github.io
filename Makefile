build:
	rm -rf ./docs
	cd ./src && hugo && cd ..
	mv ./src/public ./docs
