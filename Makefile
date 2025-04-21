UUID = mprisLabel@moon-0xff.github.com
ZIP_FILE = $(UUID).shell-extension.zip


.PHONY: build install clean

$(ZIP_FILE): src/*
	gnome-extensions pack --force --extra-source=players.js --extra-source=label.js src

gschemas: src/schemas
	glib-compile-schemas --strict $^

install: $(ZIP_FILE)
	gnome-extensions install $(ZIP_FILE)


clean:
	@rm -rf $(ZIP_FILE) src/schemas/gschemas.compiled
