CSSDIR=src/css
CSSFILES=$(CSSDIR)/sebistyle.css $(CSSDIR)/java1.css \
	$(CSSDIR)/mooc.css
TARGETCSS=target/css/sebistyle.css \
	target/css/java1.css \
	target/css/mooc.css
HEADERS=src/2019/docinfo.html src/commonhead.adoc $(CSSDIR)/sebistyle.css $(CSSDIR)/java1.css \
	$(CSSDIR)/mooc.css src/2019/docinfo-footer.html
EXDIR=src/exercises
WK5-EX=$(EXDIR)/ex84.adoc $(EXDIR)/ex85.adoc $(EXDIR)/ex86.adoc $(EXDIR)/ex87.adoc $(EXDIR)/ex88.adoc \
	$(EXDIR)/ex89.adoc $(EXDIR)/ex90.adoc $(EXDIR)/ex91.adoc $(EXDIR)/ex92.adoc $(EXDIR)/ex93.adoc
WK6-EX=$(EXDIR)/ex94.adoc $(EXDIR)/ex95.adoc $(EXDIR)/ex96.adoc $(EXDIR)/ex97.adoc $(EXDIR)/ex98.adoc \
	 	$(EXDIR)/ex99.adoc $(EXDIR)/ex100.adoc $(EXDIR)/ex101.adoc $(EXDIR)/ex102.adoc $(EXDIR)/ex103.adoc \
		$(EXDIR)/ex104.adoc $(EXDIR)/ex105.adoc $(EXDIR)/ex106.adoc

IMAGES=target/images


all: $(TARGETCSS) $(IMAGES) \
	target/2019/week01.html \
	target/2019/week02.html \
	target/2019/week03.html \
	target/2019/week04.html \
	target/2019/week05.html \
	target/2019/week06.html

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

target/2019/week05.html: src/2019/week05.adoc $(HEADERS) $(TARGETCSS) $(WK5-EX)
		mkdir -p $(@D)
		cd $(<D)
		asciidoctor -a linkcss -a stylesdir=../css -a stylesheet=java1.css  $< -o $@

target/2019/week06.html: src/2019/week06.adoc $(HEADERS) $(TARGETCSS) $(WK6-EX)
		mkdir -p $(@D)
		cd $(<D)
		asciidoctor -a linkcss -a stylesdir=../css -a stylesheet=java1.css  $< -o $@


clean:
	rm -fr target
