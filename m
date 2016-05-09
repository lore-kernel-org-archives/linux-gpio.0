From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/4] gpio: sodaville: make it explicitly non-modular
Date: Mon, 9 May 2016 19:59:55 -0400
Message-ID: <1462838398-10725-2-git-send-email-paul.gortmaker@windriver.com>
References: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "Hans J . Koch" <hjk@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_SODAVILLE
drivers/gpio/Kconfig:   bool "Intel Sodaville GPIO support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_pci_driver() uses the same init level as the
builtin_pci_driver() does, there is no init ordering change
caused by this commit.

We don't replace module.h with init.h since the file already has that.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Hans J. Koch <hjk@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-sodaville.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index e3cb6772f6ec..7da9e6c4546a 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -3,6 +3,8 @@
  *
  *  Copyright (c) 2010, 2011 Intel Corporation
  *
+ *  Author: Hans J. Koch <hjk@linutronix.de>
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License 2 as published
  *  by the Free Software Foundation.
@@ -15,7 +17,6 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/of_irq.h>
@@ -257,34 +258,17 @@ done:
 	return ret;
 }
 
-static void sdv_gpio_remove(struct pci_dev *pdev)
-{
-	struct sdv_gpio_chip_data *sd = pci_get_drvdata(pdev);
-
-	free_irq(pdev->irq, sd);
-	irq_free_descs(sd->irq_base, SDV_NUM_PUB_GPIOS);
-
-	gpiochip_remove(&sd->chip);
-	pci_release_region(pdev, GPIO_BAR);
-	iounmap(sd->gpio_pub_base);
-	pci_disable_device(pdev);
-	kfree(sd);
-}
-
 static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
 	{ 0, },
 };
 
 static struct pci_driver sdv_gpio_driver = {
+	.driver = {
+		.suppress_bind_attrs = true,
+	},
 	.name = DRV_NAME,
 	.id_table = sdv_gpio_pci_ids,
 	.probe = sdv_gpio_probe,
-	.remove = sdv_gpio_remove,
 };
-
-module_pci_driver(sdv_gpio_driver);
-
-MODULE_AUTHOR("Hans J. Koch <hjk@linutronix.de>");
-MODULE_DESCRIPTION("GPIO interface for Intel Sodaville SoCs");
-MODULE_LICENSE("GPL v2");
+builtin_pci_driver(sdv_gpio_driver);
-- 
2.8.0
