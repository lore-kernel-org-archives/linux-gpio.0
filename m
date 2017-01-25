From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: broxton: Rename apl-pinctrl driver
Date: Wed, 25 Jan 2017 22:29:34 +0200
Message-ID: <20170125202934.146544-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:18999 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751324AbdAYU3h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Jan 2017 15:29:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

While we have no users yet rename the platform driver to use the same
pattern as the rest of Intel SoCs, i.e. use full SoC name in
'apollolake-pinctrl'.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-broxton.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 8ec2b6a77745..21bff8cca3ed 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -1004,7 +1004,7 @@ static const struct acpi_device_id bxt_pinctrl_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, bxt_pinctrl_acpi_match);
 
 static const struct platform_device_id bxt_pinctrl_platform_ids[] = {
-	{ "apl-pinctrl", (kernel_ulong_t)&apl_pinctrl_soc_data },
+	{ "apollolake-pinctrl", (kernel_ulong_t)&apl_pinctrl_soc_data },
 	{ "broxton-pinctrl", (kernel_ulong_t)&bxt_pinctrl_soc_data },
 	{ },
 };
-- 
2.11.0

