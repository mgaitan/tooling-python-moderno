.PHONY: build open deploy clean

SPHINX = uvx --with sphinx-revealjs --with myst-parser --from sphinx sphinx-build
SOURCE_DIR = .
BUILD_DIR = docs
DOCTREE_DIR = .doctrees

build:
	rm -rf $(BUILD_DIR)
	$(SPHINX) -b revealjs -d $(DOCTREE_DIR) $(SOURCE_DIR) $(BUILD_DIR)
	cp slides_static/custom.css $(BUILD_DIR)/_static/custom.css
	touch $(BUILD_DIR)/.nojekyll

open: build
	uv run -m webbrowser "file://$(abspath $(BUILD_DIR))/index.html"

deploy: build
	git add README.md conf.py index.md img .gitignore Makefile $(BUILD_DIR)
	git diff --cached --quiet || git commit -m "Deploy slides"
	git push

clean:
	rm -rf $(BUILD_DIR) .doctrees
