From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Wed,  5 Oct 2016 13:57:05 +0800
Message-ID: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:35018 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751347AbcJEF5K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 01:57:10 -0400
Received: by mail-qk0-f196.google.com with SMTP id j129so12876319qkd.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2016 22:57:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

The touchscreen on some Dell machines stop working after
closing and opening the lid after this driver is introduced.
So, I add a dmi list to black out those machines that doesn't
work well with this driver.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index c725a53..f0e6c97 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/dmi.h>
 
 #include "pinctrl-intel.h"
 
@@ -554,6 +555,35 @@ static const struct acpi_device_id spt_pinctrl_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, spt_pinctrl_acpi_match);
 
+static int pinctrl_blacklist_callback(const struct dmi_system_id *id)
+{
+	pr_info("Blacklisted pinctrl-sunrisepoint for %s\n", id->ident);
+	return 1;
+}
+
+static const struct dmi_system_id pinctrl_blacklist[] = {
+	/* This driver leads to XPS(2015/2016) touchscreen failed to work
+	 * after lid close/open, so try not to load this module
+	 */
+	{
+		.callback = pinctrl_blacklist_callback,
+		.ident = "Dell XPS 13",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9350"),
+		},
+	},
+	{
+		.callback = pinctrl_blacklist_callback,
+		.ident = "Dell XPS 13",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9360"),
+		},
+	},
+	{ }     /* terminating entry */
+};
+
 static int spt_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *soc_data;
@@ -563,6 +593,9 @@ static int spt_pinctrl_probe(struct platform_device *pdev)
 	if (!id || !id->driver_data)
 		return -ENODEV;
 
+	if (dmi_check_system(pinctrl_blacklist))
+		return -ENODEV;
+
 	soc_data = (const struct intel_pinctrl_soc_data *)id->driver_data;
 	return intel_pinctrl_probe(pdev, soc_data);
 }
-- 
2.7.4

