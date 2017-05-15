From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] firmware: dmi: Add DMI_PRODUCT_FAMILY identification string
Date: Mon, 15 May 2017 14:01:01 +0300
Message-ID: <20170515110103.59765-2-mika.westerberg@linux.intel.com>
References: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Sometimes it is more convenient to be able to match a whole family of
products, like in case of bunch of Chromebooks based on Intel_Strago to
apply a driver quirk instead of quirking each machine one-by-one.

This adds support for DMI_PRODUCT_FAMILY identification string and also
exports it to the userspace through sysfs attribute just like the
existing ones.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/firmware/dmi-id.c       | 2 ++
 drivers/firmware/dmi_scan.c     | 1 +
 include/linux/mod_devicetable.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
index 44c01390d035..dc269cb288c2 100644
--- a/drivers/firmware/dmi-id.c
+++ b/drivers/firmware/dmi-id.c
@@ -47,6 +47,7 @@ DEFINE_DMI_ATTR_WITH_SHOW(product_name,		0444, DMI_PRODUCT_NAME);
 DEFINE_DMI_ATTR_WITH_SHOW(product_version,	0444, DMI_PRODUCT_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(product_serial,	0400, DMI_PRODUCT_SERIAL);
 DEFINE_DMI_ATTR_WITH_SHOW(product_uuid,		0400, DMI_PRODUCT_UUID);
+DEFINE_DMI_ATTR_WITH_SHOW(product_family,	0400, DMI_PRODUCT_FAMILY);
 DEFINE_DMI_ATTR_WITH_SHOW(board_vendor,		0444, DMI_BOARD_VENDOR);
 DEFINE_DMI_ATTR_WITH_SHOW(board_name,		0444, DMI_BOARD_NAME);
 DEFINE_DMI_ATTR_WITH_SHOW(board_version,	0444, DMI_BOARD_VERSION);
@@ -191,6 +192,7 @@ static void __init dmi_id_init_attr_table(void)
 	ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
 	ADD_DMI_ATTR(product_serial,    DMI_PRODUCT_SERIAL);
 	ADD_DMI_ATTR(product_uuid,      DMI_PRODUCT_UUID);
+	ADD_DMI_ATTR(product_family,      DMI_PRODUCT_FAMILY);
 	ADD_DMI_ATTR(board_vendor,      DMI_BOARD_VENDOR);
 	ADD_DMI_ATTR(board_name,        DMI_BOARD_NAME);
 	ADD_DMI_ATTR(board_version,     DMI_BOARD_VERSION);
diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 54be60ead08f..93f7acdaac7a 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -430,6 +430,7 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
 		dmi_save_ident(dm, DMI_PRODUCT_VERSION, 6);
 		dmi_save_ident(dm, DMI_PRODUCT_SERIAL, 7);
 		dmi_save_uuid(dm, DMI_PRODUCT_UUID, 8);
+		dmi_save_ident(dm, DMI_PRODUCT_FAMILY, 26);
 		break;
 	case 2:		/* Base Board Information */
 		dmi_save_ident(dm, DMI_BOARD_VENDOR, 4);
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 566fda587fcf..3f74ef2281e8 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -467,6 +467,7 @@ enum dmi_field {
 	DMI_PRODUCT_VERSION,
 	DMI_PRODUCT_SERIAL,
 	DMI_PRODUCT_UUID,
+	DMI_PRODUCT_FAMILY,
 	DMI_BOARD_VENDOR,
 	DMI_BOARD_NAME,
 	DMI_BOARD_VERSION,
-- 
2.11.0
