From: "qipeng.zha" <qipeng.zha@intel.com>
Subject: [PATCH] gpiolib: translate pin number in GPIO ACPI callbacks
Date: Wed, 11 Mar 2015 01:15:38 +0800
Message-ID: <1426007738-119736-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:47366 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751173AbbCJJNR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 10 Mar 2015 05:13:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, qi.zheng@intel.com, jason.cj.chen@intel.com, "qipeng.zha" <qipeng.zha@intel.com>

From: "qipeng.zha" <qipeng.zha@intel.com>

If GPIO driver use pin mapping, need to translate pin number
between ACPI table and GPIO driver.

This issue is found on one platform with Cherryview gpio
controller, kernel is hang when executed _PS0 method of
one ACPI device, since without this translation, it access
invalid gpiodesc array.

Verified it works again with this patch.

Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index c0929d9..df990f2 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -201,6 +201,10 @@ static acpi_status acpi_gpiochip_request_interrupt(struct acpi_resource *ares,
 	if (!handler)
 		return AE_BAD_PARAMETER;
 
+	pin = acpi_gpiochip_pin_to_gpio_offset(chip, pin);
+	if (pin < 0)
+		return AE_BAD_PARAMETER;
+
 	desc = gpiochip_request_own_desc(chip, pin, "ACPI:Event");
 	if (IS_ERR(desc)) {
 		dev_err(chip->dev, "Failed to request GPIO\n");
@@ -551,6 +555,12 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		struct gpio_desc *desc;
 		bool found;
 
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

