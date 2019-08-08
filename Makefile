CSSDIR=src/css
CSSFILES=$(CSSDIR)/sebistyle.css $(CSSDIR)/java1.css \
	$(CSSDIR)/mooc.css
TARGETCSS=target/css/sebistyle.css \
	target/css/java1.css \
	target/css/mooc.css
HEADERS=src/2019/docinfo.html src/commonhead.adoc $(CSSDIR)/sebistyle.css $(CSSDIR)/java1.css \
	$(CSSDIR)/mooc.css
IMAGES=target/images


all: $(TARGETCSS) $(IMAGES) \
	target/2019/week01.html \
	target/2019/week02.html \
	target/2019/week03.html \
	target/2019/week04.html 

$(IMAGES): src/images/*
	mkdir -p target/images
	rsync -aq src/images/ target/images/


$(TARGETCSS): $(CSSFILES)
	mkdir -p target/css
	cp $(CSSFILES) target/css


target/2019/week01.html: src/2019/week01.adoc $(HEADERS) $(TARGETCSS)
	mkdir -p $(@D)
	cd $(<D)
	asciidoctor -a linkcss -a stylesdir=../css -a stylesheet=java1.css  $< -o $@

target/2019/week02.html: src/2019/week03.adoc $(HEADERS) $(TARGETCSS)
	mkdir -p $(@D)
	cd $(<D)
	asciidoctor -a linkcss -a stylesdir=../css -a stylesheet=java1.css  $< -o $@

target/2019/week03.html: src/2019/week03.adoc $(HEADERS) $(TARGETCSS)
	mkdir -p $(@D)
	cd $(<D)
	asciidoctor -a linkcss -a stylesdir=../css -a stylesheet=java1.css  $< -o $@

target/2019/week04.html: src/2019/week04.adoc $(HEADERS) $(TARGETCSS)
	mkdir -p $(@D)
	cd $(<D)
	asciidoctor -a linkcss -a stylesdir=../css -a stylesheet=java1.css  $< -o $@


