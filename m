From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] pinctrl: cherryview: fix Strago DMI workaround
Date: Mon, 14 Jan 2019 19:38:36 -0800
Message-ID: <20190115033836.GA150475@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Well, hopefully 3rd time is a charm. We tried making that check
DMI_BIOS_VERSION and DMI_BOARD_VERSION, but the real one is
DMI_PRODUCT_VERSION.

Fixes: 86c5dd6860a6 ("pinctrl: cherryview: limit Strago DMI workarounds to version 1.0")
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1631930
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 9b0f4b9ef482..8efe8ea45602 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1507,7 +1507,7 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
-			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1515,7 +1515,7 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Setzer"),
-			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1523,7 +1523,7 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
-			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1531,7 +1531,7 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Celes"),
-			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
 	},
 	{}
-- 
2.20.1.97.g81188d93c3-goog


-- 
Dmitry
