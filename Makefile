# auto generated - do not edit

default: all

all:\
UNIT_TESTS/escape UNIT_TESTS/escape.ali UNIT_TESTS/escape.o \
UNIT_TESTS/getline.ali UNIT_TESTS/getline.o UNIT_TESTS/interp \
UNIT_TESTS/interp.ali UNIT_TESTS/interp.o UNIT_TESTS/rowdump.ali \
UNIT_TESTS/rowdump.o UNIT_TESTS/test.a UNIT_TESTS/test.ali UNIT_TESTS/test.o \
cstringa.ali cstringa.o ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.o ctxt/incdir.o \
ctxt/repos.o ctxt/slibdir.o ctxt/version.o deinstaller deinstaller.o inst-check \
inst-check.o inst-copy inst-copy.o inst-dir inst-dir.o inst-link inst-link.o \
install_core.o install_error.o installer installer.o instchk instchk.o \
insthier.o sqlite3-ada-conf sqlite3-ada-conf.o sqlite3-ada.a sqlite3-api.ali \
sqlite3-api.o sqlite3-constants.ali sqlite3-constants.o sqlite3-thin.ali \
sqlite3-thin.o sqlite3-types.ali sqlite3-types.o sqlite3-utils.ali \
sqlite3-utils.o sqlite3.ali sqlite3.o

# Mkf-deinstall
deinstall: deinstaller inst-check inst-copy inst-dir inst-link
	./deinstaller
deinstall-dryrun: deinstaller inst-check inst-copy inst-dir inst-link
	./deinstaller dryrun

# Mkf-install
install: installer inst-check inst-copy inst-dir inst-link postinstall
	./installer
	./postinstall

install-dryrun: installer inst-check inst-copy inst-dir inst-link
	./installer dryrun

# Mkf-instchk
install-check: instchk inst-check
	./instchk

# Mkf-test
tests:
	(cd UNIT_TESTS && make)
tests_clean:
	(cd UNIT_TESTS && make clean)

# -- SYSDEPS start
libs-sqlite3:
	@echo SYSDEPS sqlite3-libs run create libs-sqlite3 
	@(cd SYSDEPS/modules/sqlite3-libs && ./run)
_sysinfo.h:
	@echo SYSDEPS sysinfo run create _sysinfo.h 
	@(cd SYSDEPS/modules/sysinfo && ./run)


sqlite3-libs_clean:
	@echo SYSDEPS sqlite3-libs clean libs-sqlite3 
	@(cd SYSDEPS/modules/sqlite3-libs && ./clean)
sysinfo_clean:
	@echo SYSDEPS sysinfo clean _sysinfo.h 
	@(cd SYSDEPS/modules/sysinfo && ./clean)


sysdeps_clean:\
sqlite3-libs_clean \
sysinfo_clean \


# -- SYSDEPS end


UNIT_TESTS/escape:\
ada-bind ada-link UNIT_TESTS/escape.ald UNIT_TESTS/escape.ali sqlite3-utils.ali \
sqlite3.ali
	./ada-bind UNIT_TESTS/escape.ali
	./ada-link UNIT_TESTS/escape UNIT_TESTS/escape.ali

UNIT_TESTS/escape.ali:\
ada-compile UNIT_TESTS/escape.adb sqlite3-utils.ads
	./ada-compile UNIT_TESTS/escape.adb

UNIT_TESTS/escape.o:\
UNIT_TESTS/escape.ali

UNIT_TESTS/getline.ali:\
ada-compile UNIT_TESTS/getline.adb
	./ada-compile UNIT_TESTS/getline.adb

UNIT_TESTS/getline.o:\
UNIT_TESTS/getline.ali

UNIT_TESTS/interp:\
ada-bind ada-link UNIT_TESTS/interp.ald UNIT_TESTS/interp.ali \
UNIT_TESTS/getline.ali UNIT_TESTS/rowdump.ali cstringa.ali sqlite3-api.ali \
sqlite3-constants.ali sqlite3-thin.ali sqlite3-types.ali sqlite3.ali
	./ada-bind UNIT_TESTS/interp.ali
	./ada-link UNIT_TESTS/interp UNIT_TESTS/interp.ali

UNIT_TESTS/interp.ali:\
ada-compile UNIT_TESTS/interp.adb UNIT_TESTS/rowdump.ads sqlite3.ads \
sqlite3-types.ads
	./ada-compile UNIT_TESTS/interp.adb

UNIT_TESTS/interp.o:\
UNIT_TESTS/interp.ali

UNIT_TESTS/rowdump.ads:\
sqlite3-api.ads

UNIT_TESTS/rowdump.ali:\
ada-compile UNIT_TESTS/rowdump.adb UNIT_TESTS/rowdump.ads sqlite3.ads
	./ada-compile UNIT_TESTS/rowdump.adb

UNIT_TESTS/rowdump.o:\
UNIT_TESTS/rowdump.ali

UNIT_TESTS/test.a:\
cc-slib UNIT_TESTS/test.sld UNIT_TESTS/test.o
	./cc-slib UNIT_TESTS/test UNIT_TESTS/test.o

UNIT_TESTS/test.ali:\
ada-compile UNIT_TESTS/test.adb
	./ada-compile UNIT_TESTS/test.adb

UNIT_TESTS/test.o:\
UNIT_TESTS/test.ali

ada-bind:\
conf-adabind conf-systype conf-adatype conf-adabflags conf-adafflist flags-cwd

ada-compile:\
conf-adacomp conf-adatype conf-systype conf-adacflags conf-adafflist flags-cwd

ada-link:\
conf-adalink conf-adatype conf-systype conf-adaldflags conf-aldfflist \
	libs-sqlite3

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

conf-sosuffix:\
mk-sosuffix
	./mk-sosuffix > conf-sosuffix.tmp && mv conf-sosuffix.tmp conf-sosuffix

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

cstringa.ali:\
ada-compile cstringa.adb cstringa.ads
	./ada-compile cstringa.adb

cstringa.o:\
cstringa.ali

# ctxt/bindir.c.mff
ctxt/bindir.c: mk-ctxt conf-bindir
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
cc-compile ctxt/bindir.c
	./cc-compile ctxt/bindir.c

ctxt/ctxt.a:\
cc-slib ctxt/ctxt.sld ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
ctxt/slibdir.o ctxt/version.o
	./cc-slib ctxt/ctxt ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
	ctxt/slibdir.o ctxt/version.o

# ctxt/dlibdir.c.mff
ctxt/dlibdir.c: mk-ctxt conf-dlibdir
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
cc-compile ctxt/dlibdir.c
	./cc-compile ctxt/dlibdir.c

# ctxt/incdir.c.mff
ctxt/incdir.c: mk-ctxt conf-incdir
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
cc-compile ctxt/incdir.c
	./cc-compile ctxt/incdir.c

# ctxt/repos.c.mff
ctxt/repos.c: mk-ctxt conf-repos
	rm -f ctxt/repos.c
	./mk-ctxt ctxt_repos < conf-repos > ctxt/repos.c

ctxt/repos.o:\
cc-compile ctxt/repos.c
	./cc-compile ctxt/repos.c

# ctxt/slibdir.c.mff
ctxt/slibdir.c: mk-ctxt conf-slibdir
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
cc-compile ctxt/slibdir.c
	./cc-compile ctxt/slibdir.c

# ctxt/version.c.mff
ctxt/version.c: mk-ctxt VERSION
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
cc-compile ctxt/version.c
	./cc-compile ctxt/version.c

deinstaller:\
cc-link deinstaller.ld deinstaller.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a
	./cc-link deinstaller deinstaller.o insthier.o install_core.o install_error.o \
	ctxt/ctxt.a

deinstaller.o:\
cc-compile deinstaller.c install.h
	./cc-compile deinstaller.c

inst-check:\
cc-link inst-check.ld inst-check.o install_error.o
	./cc-link inst-check inst-check.o install_error.o

inst-check.o:\
cc-compile inst-check.c install.h
	./cc-compile inst-check.c

inst-copy:\
cc-link inst-copy.ld inst-copy.o install_error.o
	./cc-link inst-copy inst-copy.o install_error.o

inst-copy.o:\
cc-compile inst-copy.c install.h
	./cc-compile inst-copy.c

inst-dir:\
cc-link inst-dir.ld inst-dir.o install_error.o
	./cc-link inst-dir inst-dir.o install_error.o

inst-dir.o:\
cc-compile inst-dir.c install.h
	./cc-compile inst-dir.c

inst-link:\
cc-link inst-link.ld inst-link.o install_error.o
	./cc-link inst-link inst-link.o install_error.o

inst-link.o:\
cc-compile inst-link.c install.h
	./cc-compile inst-link.c

install_core.o:\
cc-compile install_core.c install.h
	./cc-compile install_core.c

install_error.o:\
cc-compile install_error.c install.h
	./cc-compile install_error.c

installer:\
cc-link installer.ld installer.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a
	./cc-link installer installer.o insthier.o install_core.o install_error.o \
	ctxt/ctxt.a

installer.o:\
cc-compile installer.c install.h
	./cc-compile installer.c

instchk:\
cc-link instchk.ld instchk.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a
	./cc-link instchk instchk.o insthier.o install_core.o install_error.o \
	ctxt/ctxt.a

instchk.o:\
cc-compile instchk.c install.h
	./cc-compile instchk.c

insthier.o:\
cc-compile insthier.c ctxt.h install.h
	./cc-compile insthier.c

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

mk-sosuffix:\
conf-systype

mk-systype:\
conf-cc

sqlite3-ada-conf:\
cc-link sqlite3-ada-conf.ld sqlite3-ada-conf.o ctxt/ctxt.a
	./cc-link sqlite3-ada-conf sqlite3-ada-conf.o ctxt/ctxt.a

sqlite3-ada-conf.o:\
cc-compile sqlite3-ada-conf.c ctxt.h _sysinfo.h
	./cc-compile sqlite3-ada-conf.c

sqlite3-ada.a:\
cc-slib sqlite3-ada.sld cstringa.o sqlite3-api.o sqlite3-constants.o \
sqlite3-thin.o sqlite3-types.o sqlite3-utils.o sqlite3.o
	./cc-slib sqlite3-ada cstringa.o sqlite3-api.o sqlite3-constants.o \
	sqlite3-thin.o sqlite3-types.o sqlite3-utils.o sqlite3.o

sqlite3-api.ads:\
sqlite3-types.ads

sqlite3-api.ali:\
ada-compile sqlite3-api.adb sqlite3-api.ads cstringa.ads sqlite3-constants.ads \
sqlite3-thin.ads
	./ada-compile sqlite3-api.adb

sqlite3-api.o:\
sqlite3-api.ali

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

sqlite3-utils.ali:\
ada-compile sqlite3-utils.adb sqlite3-utils.ads
	./ada-compile sqlite3-utils.adb

sqlite3-utils.o:\
sqlite3-utils.ali

sqlite3.ali:\
ada-compile sqlite3.ads sqlite3.ads
	./ada-compile sqlite3.ads

sqlite3.o:\
sqlite3.ali

clean-all: sysdeps_clean tests_clean obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f UNIT_TESTS/escape UNIT_TESTS/escape.ali UNIT_TESTS/escape.o \
	UNIT_TESTS/getline.ali UNIT_TESTS/getline.o UNIT_TESTS/interp \
	UNIT_TESTS/interp.ali UNIT_TESTS/interp.o UNIT_TESTS/rowdump.ali \
	UNIT_TESTS/rowdump.o UNIT_TESTS/test.a UNIT_TESTS/test.ali UNIT_TESTS/test.o \
	cstringa.ali cstringa.o ctxt/bindir.c ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.c \
	ctxt/dlibdir.o ctxt/incdir.c ctxt/incdir.o ctxt/repos.c ctxt/repos.o \
	ctxt/slibdir.c ctxt/slibdir.o ctxt/version.c ctxt/version.o deinstaller \
	deinstaller.o inst-check inst-check.o inst-copy inst-copy.o inst-dir inst-dir.o \
	inst-link inst-link.o install_core.o install_error.o installer installer.o \
	instchk instchk.o insthier.o sqlite3-ada-conf sqlite3-ada-conf.o sqlite3-ada.a \
	sqlite3-api.ali sqlite3-api.o sqlite3-constants.ali sqlite3-constants.o \
	sqlite3-thin.ali sqlite3-thin.o sqlite3-types.ali sqlite3-types.o \
	sqlite3-utils.ali sqlite3-utils.o sqlite3.ali sqlite3.o
ext_clean:
	rm -f conf-adatype conf-cctype conf-ldtype conf-sosuffix conf-systype mk-ctxt

regen:\
ada-srcmap ada-srcmap-all
	./ada-srcmap-all
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
