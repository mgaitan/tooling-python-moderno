.PHONY: build open deploy clean

SPHINX = uvx --with sphinx-revealjs --with myst-parser --from sphinx sphinx-build
SOURCE_DIR = .
BUILD_DIR = docs
DOCTREE_DIR = .doctrees

build:
	rm -rf $(BUILD_DIR)
	$(SPHINX) -b revealjs -d $(DOCTREE_DIR) $(SOURCE_DIR) $(BUILD_DIR)
	touch $(BUILD_DIR)/.nojekyll

open: build
	python3 -m webbrowser "file://$(abspath $(BUILD_DIR))/index.html"

deploy: build
	git add README.md conf.py index.md img .gitignore Makefile $(BUILD_DIR)
	git diff --cached --quiet || git commit -m "Deploy slides"
	git push

clean:
	rm -rf $(BUILD_DIR) .doctrees
