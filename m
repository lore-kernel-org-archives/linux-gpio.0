From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] pinctrl: cherryview: Extend the Chromebook DMI quirk to Intel_Strago systems
Date: Mon, 15 May 2017 14:01:03 +0300
Message-ID: <20170515110103.59765-4-mika.westerberg@linux.intel.com>
References: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

It turns out there are quite many Chromebooks out there that have the
same keyboard issue than Acer Chromebook. All of them are based on
Intel_Strago reference and report their DMI_PRODUCT_FAMILY as
"Intel_Strago" (Samsung Chromebook 3 and Cyan Chromebooks are exceptions
for which we add separate entries).

Instead of adding each machine to the quirk table, we use
DMI_PRODUCT_FAMILY of "Intel_Strago" that hopefully covers most of the
machines out there currently.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
Suggested: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index e35d0fe4c737..3366959cf988 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1539,13 +1539,28 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
  * is not listed below.
  */
 static const struct dmi_system_id chv_no_valid_mask[] = {
+	/* See https://bugzilla.kernel.org/show_bug.cgi?id=194945 */
 	{
-		/* See https://bugzilla.kernel.org/show_bug.cgi?id=194945 */
-		.ident = "Acer Chromebook (CYAN)",
+		.ident = "Intel_Strago based Chromebooks",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Edgar"),
-			DMI_MATCH(DMI_BIOS_DATE, "05/21/2016"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
+		},
+	},
+	{
+		.ident = "Cyan Chromebook",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
+			DMI_MATCH(DMI_BIOS_DATE, "05/20/2016"),
+		},
+	},
+	{
+		.ident = "Samsung Chromebook 3",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Celes"),
+			DMI_MATCH(DMI_BIOS_DATE, "01/19/2017"),
 		},
 	},
 	{}
-- 
2.11.0
