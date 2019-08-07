CSSDIR=../css
include ../Makefile.macros
HEADERS=docinfo.html ../commonhead.adoc $(CSSDIR)/sebistyle.css \
	$(CSSDIR)/mooc.css 

#index2017.html: index2017.adoc usbstick.adoc
all: week01.html 

week01.html: week01.adoc $(HEADERS)


clean:
	rm -f week*.html
