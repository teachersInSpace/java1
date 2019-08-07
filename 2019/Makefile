CSSDIR=../css
include ../Makefile.macros
HEADERS=docinfo.html ../commonhead.adoc $(CSSDIR)/sebistyle.css $(CSSDIR)/java1.css \
	$(CSSDIR)/mooc.css

#index2017.html: index2017.adoc usbstick.adoc
all: week01.html  week02.html week03.html

week01.html: week01.adoc $(HEADERS)

week02.html: week02.adoc $(HEADERS) ../exercises/*.adoc

week03.html: week03.adoc $(HEADERS) ../exercises/*.adoc

clean:
	rm -f week*.html
