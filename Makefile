SRC_DIR := src

.PHONY: build refresh-browser

build: build-site refresh-browser

build-site:
	ruby $(SRC_DIR)/generate.rb > index.html

refresh-browser:
	@osascript scripts/refresh-browser.scpt

serve: build
	@open -a '/Applications/Safari.app' 'http://localhost:4000'
	@python -m SimpleHTTPServer 4000
