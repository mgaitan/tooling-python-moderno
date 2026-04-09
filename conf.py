from __future__ import annotations

project = "Tooling moderno en Python"
author = "Martín Gaitán"
language = "es"
root_doc = "index"

extensions = [
    "myst_parser",
    "sphinx_revealjs",
]

myst_enable_extensions = [
    "colon_fence",
]

exclude_patterns = [
    "docs",
    ".doctrees",
    "README.md",
]

html_static_path = ["img", "slides_static"]

revealjs_style_theme = "white"
revealjs_static_path = ["img"]
revealjs_css_files = ["custom.css"]

revealjs_script_conf = {
    "hash": True,
    "slideNumber": True,
    "transition": "slide",
}
