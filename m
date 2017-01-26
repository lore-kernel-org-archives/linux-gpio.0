From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: broxton: No need to take pointer of a pointer
Date: Thu, 26 Jan 2017 17:10:38 +0200
Message-ID: <20170126151038.37977-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:28921 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752786AbdAZPLM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 10:11:12 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There is no need to take pointer of a pointer to an array of SoC data in
platform driver.

Do it in the same way as it's done for ACPI.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-broxton.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 21bff8cca3ed..e6e6fd112585 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -1004,8 +1004,8 @@ static const struct acpi_device_id bxt_pinctrl_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, bxt_pinctrl_acpi_match);
 
 static const struct platform_device_id bxt_pinctrl_platform_ids[] = {
-	{ "apollolake-pinctrl", (kernel_ulong_t)&apl_pinctrl_soc_data },
-	{ "broxton-pinctrl", (kernel_ulong_t)&bxt_pinctrl_soc_data },
+	{ "apollolake-pinctrl", (kernel_ulong_t)apl_pinctrl_soc_data },
+	{ "broxton-pinctrl", (kernel_ulong_t)bxt_pinctrl_soc_data },
 	{ },
 };
 
-- 
2.11.0

