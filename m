From: Antonio Ospite <ao2@ao2.it>
Subject: [PATCH] pinctrl: baytrail: explicitly set gpio chip base
Date: Wed, 29 Apr 2015 11:02:42 +0200
Message-ID: <1430298162-20238-1-git-send-email-ao2@ao2.it>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp208.alice.it ([82.57.200.104]:38964 "EHLO smtp208.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1031729AbbD2JIj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 29 Apr 2015 05:08:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Antonio Ospite <ao2@ao2.it>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>

Having the gpio chip base set explicitly makes it easier to compare the
GPIOs definitions with the ones found on some Android kernels.

Signed-off-by: Antonio Ospite <ao2@ao2.it>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 2062c22..4b2f594 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -548,6 +548,7 @@ static int byt_gpio_probe(struct platform_device *pdev)
 	struct acpi_device *acpi_dev;
 	struct pinctrl_gpio_range *range;
 	acpi_handle handle = ACPI_HANDLE(dev);
+	int base_offset;
 	int ret;
 
 	if (acpi_bus_get_device(handle, &acpi_dev))
@@ -559,12 +560,14 @@ static int byt_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	base_offset = 0;
 	for (range = byt_ranges; range->name; range++) {
 		if (!strcmp(acpi_dev->pnp.unique_id, range->name)) {
 			vg->chip.ngpio = range->npins;
 			vg->range = range;
 			break;
 		}
+		base_offset += range->npins;
 	}
 
 	if (!vg->chip.ngpio || !vg->range)
@@ -590,7 +593,7 @@ static int byt_gpio_probe(struct platform_device *pdev)
 	gc->get = byt_gpio_get;
 	gc->set = byt_gpio_set;
 	gc->dbg_show = byt_gpio_dbg_show;
-	gc->base = -1;
+	gc->base = base_offset;
 	gc->can_sleep = false;
 	gc->dev = dev;
 
-- 
2.1.4

