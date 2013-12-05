From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] SFI: fix compiler warnings
Date: Thu,  5 Dec 2013 18:36:47 +0200
Message-ID: <1386261409-13850-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:43554 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756771Ab3LEQhj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 5 Dec 2013 11:37:39 -0500
In-Reply-To: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This fixes the following compiler warnings when build is done by make W=
=3D1.

drivers/sfi/sfi_acpi.c:154:5: warning: no previous prototype for =E2=80=
=98sfi_acpi_table_parse=E2=80=99 [-Wmissing-prototypes]

drivers/sfi/sfi_core.c:164:26: warning: no previous prototype for =E2=80=
=98sfi_map_table=E2=80=99 [-Wmissing-prototypes]
drivers/sfi/sfi_core.c:192:6: warning: no previous prototype for =E2=80=
=98sfi_unmap_table=E2=80=99 [-Wmissing-prototypes]

Indentation fixes are also included.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/sfi/sfi_acpi.c | 9 +++++----
 drivers/sfi/sfi_core.c | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/sfi/sfi_acpi.c b/drivers/sfi/sfi_acpi.c
index f5b4ca5..1332546 100644
--- a/drivers/sfi/sfi_acpi.c
+++ b/drivers/sfi/sfi_acpi.c
@@ -63,6 +63,8 @@
 #include <acpi/acpi.h>
=20
 #include <linux/sfi.h>
+#include <linux/sfi_acpi.h>
+
 #include "sfi_core.h"
=20
 /*
@@ -152,7 +154,7 @@ static void sfi_acpi_put_table(struct acpi_table_he=
ader *table)
  * Find specified table in XSDT, run handler on it and return its retu=
rn value
  */
 int sfi_acpi_table_parse(char *signature, char *oem_id, char *oem_tabl=
e_id,
-			int(*handler)(struct acpi_table_header *))
+			 int(*handler)(struct acpi_table_header *))
 {
 	struct acpi_table_header *table =3D NULL;
 	struct sfi_table_key key;
@@ -175,8 +177,8 @@ int sfi_acpi_table_parse(char *signature, char *oem=
_id, char *oem_table_id,
 }
=20
 static ssize_t sfi_acpi_table_show(struct file *filp, struct kobject *=
kobj,
-			       struct bin_attribute *bin_attr, char *buf,
-			       loff_t offset, size_t count)
+				   struct bin_attribute *bin_attr, char *buf,
+				   loff_t offset, size_t count)
 {
 	struct sfi_table_attr *tbl_attr =3D
 	    container_of(bin_attr, struct sfi_table_attr, attr);
@@ -199,7 +201,6 @@ static ssize_t sfi_acpi_table_show(struct file *fil=
p, struct kobject *kobj,
 	return cnt;
 }
=20
-
 void __init sfi_acpi_sysfs_init(void)
 {
 	u32 tbl_cnt, i;
diff --git a/drivers/sfi/sfi_core.c b/drivers/sfi/sfi_core.c
index 1e824fb..296db7a 100644
--- a/drivers/sfi/sfi_core.c
+++ b/drivers/sfi/sfi_core.c
@@ -161,7 +161,7 @@ static int sfi_verify_table(struct sfi_table_header=
 *table)
  * Check for common case that we can re-use mapping to SYST,
  * which requires syst_pa, syst_va to be initialized.
  */
-struct sfi_table_header *sfi_map_table(u64 pa)
+static struct sfi_table_header *sfi_map_table(u64 pa)
 {
 	struct sfi_table_header *th;
 	u32 length;
@@ -189,7 +189,7 @@ struct sfi_table_header *sfi_map_table(u64 pa)
  * Undoes effect of sfi_map_table() by unmapping table
  * if it did not completely fit on same page as SYST.
  */
-void sfi_unmap_table(struct sfi_table_header *th)
+static void sfi_unmap_table(struct sfi_table_header *th)
 {
 	if (!TABLE_ON_PAGE(syst_va, th, th->len))
 		sfi_unmap_memory(th, TABLE_ON_PAGE(th, th, th->len) ?
--=20
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
