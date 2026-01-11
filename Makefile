.PHONY: all check build gallery deb clean install

all: check build

check:
	python3 sdk/cli.py check

build:
	python3 sdk/cli.py build

gallery:
	python3 sdk/cli.py gallery

deb:
	./packaging/build_deb.sh

clean:
	rm -rf build/ dist/ *.egg-info __pycache__
	rm -f princetheme_*.deb
	rm -rf PrinceTheme/variants/theme_variant*.txt

install:
	sudo ./install.sh

test-docker:
	docker build -t princetheme-test .
	docker run --rm princetheme-test
