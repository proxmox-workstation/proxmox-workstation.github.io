VERSION = "6.1.10"

all: Packages.gz
.PHONY: all

Packages.gz: asusctl.deb
	dpkg-scanpackages . | gzip -9c > Packages.gz

asusctl-$(VERSION).tar.bz2:
	wget https://gitlab.com/asus-linux/asusctl/-/archive/$(VERSION)/asusctl-$(VERSION).tar.bz2

temp/asusctl-$(VERSION)/Cargo.toml: asusctl-$(VERSION).tar.bz2
	tar -xvf asusctl-$(VERSION).tar.bz2
	mv asusctl-$(VERSION) temp/

asusctl.deb: asusctl-$(VERSION).tar.bz2	
	$(MAKE) -C temp/asusctl-$(VERSION) all
	$(MAKE) -C temp/asusctl-$(VERSION) DESTDIR=asusctl install
	dpkg-deb --root-owner-group --build asusctl

clean:
	rm -rf Packages.gz *.deb *.tar.bz2 temp/*
.PHONY: clean