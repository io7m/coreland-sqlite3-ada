# auto generated - do not edit

default: all

all:\
sqlite3-ada.a sqlite3-constants.ali sqlite3-constants.o sqlite3-thin.ali \
sqlite3-thin.o sqlite3-types.ali sqlite3-types.o sqlite3.ali sqlite3.o

ada-bind:\
conf-adabind conf-systype conf-adatype conf-adabflags

ada-compile:\
conf-adacomp conf-adatype conf-systype conf-adacflags

ada-link:\
conf-adalink conf-adatype conf-systype conf-adaldflags

ada-srcmap:\
conf-adacomp conf-adatype conf-systype

ada-srcmap-all:\
ada-srcmap conf-adacomp conf-adatype conf-systype

cc-compile:\
conf-cc conf-cctype conf-systype

cc-link:\
conf-ld conf-ldtype conf-systype

cc-slib:\
conf-systype

conf-adatype:\
mk-adatype
	./mk-adatype > conf-adatype.tmp && mv conf-adatype.tmp conf-adatype

conf-cctype:\
conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

mk-adatype:\
conf-adacomp conf-systype

mk-cctype:\
conf-cc conf-systype

mk-ctxt:\
mk-mk-ctxt
	./mk-mk-ctxt

mk-ldtype:\
conf-ld conf-systype conf-cctype

mk-mk-ctxt:\
conf-cc

mk-systype:\
conf-cc

sqlite3-ada.a:\
cc-slib sqlite3-ada.sld sqlite3-constants.o sqlite3-thin.o sqlite3-types.o \
sqlite3.o
	./cc-slib sqlite3-ada sqlite3-constants.o sqlite3-thin.o sqlite3-types.o \
	sqlite3.o

sqlite3-constants.ali:\
ada-compile sqlite3-constants.ads sqlite3-constants.ads
	./ada-compile sqlite3-constants.ads

sqlite3-constants.o:\
sqlite3-constants.ali

sqlite3-thin.ali:\
ada-compile sqlite3-thin.ads sqlite3-thin.ads sqlite3-types.ads
	./ada-compile sqlite3-thin.ads

sqlite3-thin.o:\
sqlite3-thin.ali

sqlite3-types.ali:\
ada-compile sqlite3-types.ads sqlite3-types.ads
	./ada-compile sqlite3-types.ads

sqlite3-types.o:\
sqlite3-types.ali

sqlite3.ali:\
ada-compile sqlite3.ads sqlite3.ads
	./ada-compile sqlite3.ads

sqlite3.o:\
sqlite3.ali

clean-all: obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f sqlite3-ada.a sqlite3-constants.ali sqlite3-constants.o sqlite3-thin.ali \
	sqlite3-thin.o sqlite3-types.ali sqlite3-types.o sqlite3.ali sqlite3.o
ext_clean:
	rm -f conf-adatype conf-cctype conf-ldtype conf-systype mk-ctxt

regen:\
ada-srcmap ada-srcmap-all
	./ada-srcmap-all
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
