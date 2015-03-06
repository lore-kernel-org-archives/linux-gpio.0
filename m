From: "qipeng.zha" <qipeng.zha@intel.com>
Subject: [PATCH] gpiolib: fix issue of gpio acpi handler
Date: Fri,  6 Mar 2015 23:08:38 +0800
Message-ID: <1425654518-48935-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:49461 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752261AbbCFHGJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 6 Mar 2015 02:06:09 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, qi.zheng@intel.com, "qipeng.zha" <qipeng.zha@intel.com>

From: "qipeng.zha" <qipeng.zha@intel.com>

If GPIO driver use pin mapping, need to tranlate pin number
between ACPI table and GPIO driver.

This issue is found on one platform with Cherryview gpio
controller, kernel is hang when executed _PS0 method of
one ACPI device, since without this translation, it access
invalid gpiodesc array.

Verified it works again with this patch.

Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index c0929d9..661e272 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -551,6 +551,13 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		struct gpio_desc *desc;
 		bool found;
 
+		/*Translate ACPI gpio pin to offset in gpio driver*/
+		pin = acpi_gpiochip_pin_to_gpio_offset(chip, pin);
+		if (pin < 0) {
+			status = AE_BAD_PARAMETER;
+			goto out;
+		}
+
 		mutex_lock(&achip->conn_lock);
 
 		found = false;
-- 
1.8.3.2

