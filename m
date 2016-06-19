From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: intel-mid: switch to devm_gpiochip_add_data()
Date: Sun, 19 Jun 2016 23:49:57 +0300
Message-ID: <1466369397-99608-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:38628 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751524AbcFSUuH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 19 Jun 2016 16:50:07 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The error handling is not correct since the commit 3f7dbfd8eea9 ("gpio:
intel-mid: switch to using gpiolib irqchip helpers"). Switch to devres API to
fix the potential resource leak.

Fixes: commit 3f7dbfd8eea9 ("gpio: intel-mid: switch to using gpiolib irqchip helpers")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-intel-mid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index cdaba13..a99cf4b 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -401,7 +401,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 	spin_lock_init(&priv->lock);
 
 	pci_set_drvdata(pdev, priv);
-	retval = gpiochip_add_data(&priv->chip, priv);
+	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
 	if (retval) {
 		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
 		return retval;
-- 
2.8.1

