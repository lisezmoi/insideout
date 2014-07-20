BROWSERIFY=./node_modules/.bin/browserify
STYLUS=./node_modules/.bin/stylus

all: js css

dist:
	$(STYLUS) --compress < index.styl > dist/bundle.css
	$(BROWSERIFY) src/index.js | ./node_modules/.bin/uglifyjs > dist/bundle.js

js:
	$(BROWSERIFY) src/index.js > dist/bundle.js

css:
	$(STYLUS) < index.styl > dist/bundle.css

deps:
	npm install

.PHONY: all js css install dist
