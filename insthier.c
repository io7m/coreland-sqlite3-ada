#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "sqlite3-ada-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-constants.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-constants.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sqlite3-thin.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-thin.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sqlite3-types.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-types.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sqlite3.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sqlite3-constants.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-constants.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sqlite3-thin.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-thin.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sqlite3-types.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-types.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sqlite3.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sqlite3-ada.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-ada.a", "libsqlite3-ada.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "sqlite3-ada-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sqlite3-ada-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
