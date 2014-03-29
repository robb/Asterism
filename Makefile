BUILD_DIR := _site
SRC_DIR := src

.PHONY: build refresh-browser

build: build-site refresh-browser

build-site:
	@mkdir -p $(BUILD_DIR)
	ruby $(SRC_DIR)/generate.rb > $(BUILD_DIR)/index.html

refresh-browser:
	@osascript scripts/refresh-browser.scpt

serve: build
	@open -a '/Applications/Safari.app' 'http://localhost:4000'
	@cd $(BUILD_DIR) && python -m SimpleHTTPServer 4000
