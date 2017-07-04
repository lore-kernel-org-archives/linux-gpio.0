From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: cherryview: Add Setzer models to the Chromebook DMI quirk
Date: Tue,  4 Jul 2017 15:58:39 +0300
Message-ID: <20170704125839.16093-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:6079 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752736AbdGDM67 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jul 2017 08:58:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, mail@abhishek.geek.nz
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Add one more model to the Chromebook DMI quirk to make it working again.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
Fixes: 2a8209fa6823 ("pinctrl: cherryview: Extend the Chromebook DMI quirk to Intel_Strago systems")
Reported-by: mail@abhishek.geek.nz
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 20f1b4493994..04e929fd0ffe 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1548,6 +1548,13 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		},
 	},
 	{
+		.ident = "HP Chromebook 11 G5 (Setzer)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Setzer"),
+		},
+	},
+	{
 		.ident = "Acer Chromebook R11 (Cyan)",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
-- 
2.11.0

